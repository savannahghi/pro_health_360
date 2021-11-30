// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/feed_content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class RecentContentWidget extends StatefulWidget {
  const RecentContentWidget();

  @override
  State<RecentContentWidget> createState() => _RecentContentWidgetState();
}

class _RecentContentWidgetState extends State<RecentContentWidget> {
  late Stream<dynamic> _stream;
  late StreamController<dynamic> _streamController;

  @override
  void initState() {
    _streamController = StreamController<dynamic>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await genericFetchFunction(
        streamController: _streamController,
        context: context,
        logTitle: 'Fetch content',
        queryString: getContentQuery,
        variables: <String, dynamic>{
          'categoryID': 2,
          'Limit': '5',
        },
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
              await genericFetchFunction(
                streamController: _streamController,
                context: context,
                logTitle: 'Fetch content',
                queryString: getContentQuery,
                variables: <String, dynamic>{
                  'categoryID': 2,
                  'Limit': '10',
                },
              );
            },
            messageBody: feedErrorDetail,
          );
        }

        if (snapshot.hasData) {
          final FeedContent recentFeedContent = FeedContent.fromJson(
            snapshot.data as Map<String, dynamic>,
          );

          if (recentFeedContent.feedContent != null) {
            final List<Content?>? feedItems =
                recentFeedContent.feedContent?.items;

            if (feedItems != null && feedItems.isNotEmpty) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
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
                            onTap: () {
                              navigateToNewPage(
                                context: context,
                                route: BWRoutes.feedPage,
                                bottomNavIndex: 1,
                              );
                            },
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
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: feedItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Content? feedDetails =
                              feedItems.elementAt(index);
                          return Padding(
                            padding:
                                EdgeInsets.only(left: index == 0 ? 15 : 10),
                            child: ContentItem(
                              contentDetails: feedDetails!,
                              isNew: true,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        }
        return const SizedBox();
      },
    );
  }
}