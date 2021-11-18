// Flutter imports:
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/feed/widgets/suggested_group_card.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

/// [SuggestedGroupsSection] is a widget used in the Feed Page
///
/// It takes in a required [suggestedGroups] parameter which is a List of
/// the suggested groups or communities a user can join

class SuggestedGroupsSection extends StatefulWidget {
  const SuggestedGroupsSection();

  @override
  State<SuggestedGroupsSection> createState() => _SuggestedGroupsSectionState();
}

class _SuggestedGroupsSectionState extends State<SuggestedGroupsSection> {
  late Stream<Object> _stream;
  late StreamController<Object> _streamController;

  @override
  void initState() {
    _streamController = StreamController<Object>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await customFetchData(
        streamController: _streamController,
        context: context,
        logTitle: 'Fetch suggested groups',
        queryString: fetchSuggestedGroupsQuery,
        variables: <String, dynamic>{},
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //show the loader before the data is displayed
        if (snapshot.data is Map<String, dynamic> &&
            snapshot.data != null &&
            snapshot.data['loading'] != null &&
            snapshot.data['loading'] == true) {
          return Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: const SILPlatformLoader(),
          );
        }

        //error checking
        if (snapshot.hasError) {
          reportErrorToSentry(
            context,
            snapshot.error,
            hint: 'Timeout fetching recent content',
          );
          final dynamic valueHolder = snapshot.error;
          final Map<String, dynamic>? error = snapshot.error == null
              ? null
              : valueHolder as Map<String, dynamic>;

          /// check if the error is a timeout error and return an appropriate widget
          if (error == null || error['error'] == 'timeout') {
            return const GenericTimeoutWidget(
              route: BWRoutes.home,
              action: 'fetching recent content',
            );
          }

          return GenericNoData(
            key: helpNoDataWidgetKey,
            type: GenericNoDataTypes.ErrorInData,
            actionText: actionTextGenericNoData,
            recoverCallback: () async {
              await customFetchData(
                streamController: _streamController,
                context: context,
                logTitle: 'Fetch suggested groups',
                queryString: fetchSuggestedGroupsQuery,
                variables: <String, dynamic>{},
              );
            },
            messageBody: messageBodyGenericNoData,
          );
        }

        if (snapshot.hasData && snapshot.data['fetchSuggestedGroups'] != null) {
          final List<dynamic> suggestedGroups =
              snapshot.data['fetchSuggestedGroups'] as List<dynamic>;

          return Container(
            padding: const EdgeInsets.all(5.0),
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (suggestedGroups.isNotEmpty) ...<Widget>{
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      suggestedGroupsString,
                      overflow: TextOverflow.ellipsis,
                      style: TextThemes.veryBoldSize16Text(
                        AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  verySmallVerticalSizedBox,
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: suggestedGroups.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final Group currentGroup = Group.fromJson(
                          suggestedGroups.elementAt(index)
                              as Map<String, dynamic>,
                        );

                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SuggestedGroupCard(group: currentGroup),
                        );
                      },
                    ),
                  ),
                },
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
