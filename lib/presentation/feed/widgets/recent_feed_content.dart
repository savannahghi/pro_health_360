// Flutter imports:
import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/presentation/feed/widgets/content_item.dart';
import 'package:shared_ui_components/platform_loader.dart';

class RecentFeedContent extends StatefulWidget {
  const RecentFeedContent();

  @override
  State<RecentFeedContent> createState() => _RecentFeedContentState();
}

class _RecentFeedContentState extends State<RecentFeedContent> {
  late Stream<dynamic> _stream;
  late StreamController<dynamic> _streamController;

  @override
  void initState() {
    _streamController = StreamController<dynamic>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await customFetchData(
        streamController: _streamController,
        context: context,
        logTitle: 'Fetch recent content content',
        queryString: fetchRecentContentQuery,
        variables: <String, dynamic>{},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
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
                logTitle: 'Fetch recent content content',
                queryString: fetchRecentContentQuery,
                variables: <String, dynamic>{},
              );
            },
            messageBody: messageBodyGenericNoData,
          );
        }

        if (snapshot.hasData) {
          // TODO!!(abiud): the data could be missing this key
          final List<dynamic> recentContent =
              snapshot.data['fetchRecentContent'] as List<dynamic>;

          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        newContentText,
                        style: TextThemes.veryBoldSize16Text(
                          AppColors.secondaryColor,
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      GestureDetector(
                        key: viewAllButtonKey,
                        onTap: () => StoreProvider.dispatch<AppState>(
                          context,
                          BottomNavAction(currentBottomNavIndex: 1),
                        ),
                        child: Text(
                          viewAllText,
                          style: TextThemes.normalSize16Text(
                            AppColors.secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO!!(abiud): handle empty recent content
                if (recentContent.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: recentContent.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Content feedDetails = Content.fromJson(
                          recentContent.elementAt(index)
                              as Map<String, dynamic>,
                        );
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 15 : 10),
                          child: ContentItem(contentDetails: feedDetails),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}