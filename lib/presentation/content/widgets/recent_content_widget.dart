// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/content/fetch_content_action.dart';
import 'package:pro_health_360/application/redux/actions/content/fetch_recent_content_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/content/content_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/content_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/content/widgets/feed_page_content_item.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:pro_health_360/presentation/core/widgets/generic_zero_state_widget.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class RecentContentWidget extends StatelessWidget {
  const RecentContentWidget();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContentViewModel>(
      onInit: (Store<AppState> store) {
        final bool isSignedIn = store.state.credentials?.isSignedIn ?? false;
        final ContentState? contentState = store.state.contentState;

        if (isSignedIn) {
          final bool isRecentContentEmpty =
              contentState?.recentContentState?.contentItems?.isEmpty ?? true;
          final bool isFeedEmpty =
              contentState?.feedContentState?.contentItems?.isEmpty ?? true;

          if (isRecentContentEmpty) {
            store.dispatch(FetchRecentContentAction(context: context));
          }

          if (isFeedEmpty) {
            store.dispatch(FetchContentAction(context: context));
          }
        }
      },
      converter: (Store<AppState> store) =>
          ContentViewModel.fromStore(store.state),
      builder: (BuildContext context, ContentViewModel vm) {
        if (vm.wait?.isWaitingFor(fetchRecentContentFlag) ?? false) {
          return Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            child: const PlatformLoader(),
          );
        } else if (vm.recentContentState?.timeoutFetchingContent ?? false) {
          return const GenericTimeoutWidget(
            route: AppRoutes.home,
            action: 'fetching your recent content',
          );
        } else if (vm.recentContentState?.errorFetchingContent ?? false) {
          return GenericErrorWidget(
            actionKey: helpNoDataWidgetKey,
            recoverCallback: () async {
              StoreProvider.dispatch<AppState>(
                context,
                FetchRecentContentAction(context: context),
              );
            },
            messageBody: const <TextSpan>[
              TextSpan(text: messageBodyGenericErrorWidget)
            ],
          );
        } else {
          final List<Content?>? recentContent =
              vm.recentContentState?.contentItems;

          if (recentContent?.isNotEmpty ?? false) {
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
                          style: veryBoldSize16Text(AppColors.secondaryColor),
                        ),
                        verySmallVerticalSizedBox,
                        GestureDetector(
                          key: viewAllButtonKey,
                          onTap: () async {
                            /// Log event to google analytics
                            await AnalyticsService().logEvent(
                              name: viewAllContentEvent,
                              eventType: AnalyticsEventType.NAVIGATION,
                            );
                            navigateToNewPage(
                              context: context,
                              route: AppRoutes.feedPage,
                              bottomNavIndex: 1,
                            );
                          },
                          child: Text(
                            viewAllText,
                            style: normalSize16Text(AppColors.secondaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.304,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: recentContent!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Content? contentDetails =
                            recentContent.elementAt(index);

                        final Row heroImage = Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: GalleryImageWidget(
                                imageUrl: contentDetails?.heroImage?.url ?? '',
                                height: 170,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                            ),
                          ],
                        );

                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 15 : 10),
                          child: FeedPageContentItem(
                            content: contentDetails!,
                            heroImage: heroImage,
                            isNew: true,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              child: GenericZeroStateWidget(
                callBackFunction: () {
                  StoreProvider.dispatch<AppState>(
                    context,
                    FetchRecentContentAction(context: context),
                  );
                },
                iconUrl: contentZeroStateImageUrl,
                title: contentZeroStateTitle,
                description: contentZeroStateDescription,
                buttonText: contentZeroStateButtonText,
              ),
            );
          }
        }
      },
    );
  }
}
