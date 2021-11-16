// Flutter imports:
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

// Package imports:

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/feed/content_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/widgets/text_loading_shimmer.dart';
import 'package:shared_themes/text_themes.dart';

class FeedPage extends StatefulWidget {
  const FeedPage();

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _choiceIndex = 0;

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
        logTitle: 'Fetch recent content',
        queryString: fetchContentQuery,
        variables: <String, dynamic>{
          'limit': 10,
          'tags': <String>['health', 'fitness']
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: libraryTitle, showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _buildFeedFilters(context),
            ),
            StreamBuilder<dynamic>(
              stream: _stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                //show the loader before the data is displayed
                if (snapshot.data is Map<String, dynamic> &&
                    snapshot.data != null &&
                    snapshot.data['loading'] != null &&
                    snapshot.data['loading'] == true) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextLoadingShimmer(),
                  );
                }

                //error checking
                if (snapshot.hasError) {
                  reportErrorToSentry(
                    context,
                    snapshot.error,
                    hint: 'Timeout while fetching your content',
                  );
                  final dynamic valueHolder = snapshot.error;
                  final Map<String, dynamic>? error = snapshot.error == null
                      ? null
                      : valueHolder as Map<String, dynamic>;

                  /// check if the error is a timeout error and return an appropriate widget
                  if (error == null || error['error'] == 'timeout') {
                    return const GenericTimeoutWidget(
                      route: BWRoutes.home,
                      action: 'fetching your feed',
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
                        queryString: fetchContentQuery,
                        variables: <String, dynamic>{},
                      );
                    },
                    messageBody: messageBodyGenericNoData,
                  );
                }

                if (snapshot.hasData) {
                  final List<dynamic> feedItems =
                      snapshot.data['fetchContent'] as List<dynamic>;

                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: feedItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Content currentFeedItem = Content.fromJson(
                          feedItems.elementAt(index) as Map<String, dynamic>,
                        );

                        return Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? 15 : 7.5,
                            bottom: 10,
                          ),
                          child: ContentItem(
                            contentDetails: currentFeedItem,
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedFilters(BuildContext context) {
    final List<String> _choices = <String>[
      allString,
      recommendedString,
      exerciseString,
      dietString,
    ];
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 1 : 7.5),
            child: ChoiceChip(
              label: Text(
                _choices[index],
                style: TextThemes.normalSize16Text().copyWith(
                  color: _choiceIndex == index
                      ? AppColors.whiteColor
                      : AppColors.secondaryColor,
                ),
              ),
              labelStyle: const TextStyle(color: AppColors.whiteColor),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.whiteColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              selected: _choiceIndex == index,
              selectedColor: AppColors.secondaryColor,
              onSelected: (bool selected) {
                setState(() {
                  _choiceIndex = selected ? index : 0;
                });
              },
              backgroundColor: Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}
