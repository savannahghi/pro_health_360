// Dart imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/content/fetch_content_action.dart';
import 'package:myafyahub/application/redux/actions/content/fetch_recent_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/recent_content_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class RecentContentWidget extends StatefulWidget {
  const RecentContentWidget();

  @override
  State<RecentContentWidget> createState() => _RecentContentWidgetState();
}

class _RecentContentWidgetState extends State<RecentContentWidget> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      final ContentState? state =
          StoreProvider.state<AppState>(context)?.contentState;

      if (state?.recentContentState?.contentItems?.isEmpty ?? true) {
        StoreProvider.dispatch<AppState>(
          context,
          FetchRecentContentAction(context: context),
        );
      }

      if (state?.feedContentState?.contentItems?.isEmpty ?? true) {
        StoreProvider.dispatch<AppState>(
          context,
          FetchContentAction(context: context),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RecentContentViewModel>(
      converter: (Store<AppState> store) =>
          RecentContentViewModel.fromStore(store.state),
      builder: (BuildContext context, RecentContentViewModel vm) {
        if (vm.wait?.isWaitingFor(fetchRecentContentFlag) ?? false) {
          return Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            child: const SILPlatformLoader(),
          );
        } else if (vm.timeoutFetchingContent ?? false) {
          return const GenericTimeoutWidget(
            route: BWRoutes.home,
            action: 'fetching your recent content',
          );
        } else if (vm.errorFetchingContent ?? false) {
          return GenericNoData(
            key: helpNoDataWidgetKey,
            type: GenericNoDataTypes.ErrorInData,
            actionText: actionTextGenericNoData,
            recoverCallback: () async {
              StoreProvider.dispatch<AppState>(
                context,
                FetchRecentContentAction(context: context),
              );
            },
            messageBody: messageBodyGenericNoData,
          );
        } else {
          final List<Content?>? recentContent = vm.contentItems;

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
                      itemCount: recentContent!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Content? contentDetails =
                            recentContent.elementAt(index);
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 15 : 10),
                          child: ContentItem(
                            contentDetails: contentDetails!,
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
        return const SizedBox();
      },
    );
  }
}
