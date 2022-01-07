// Dart imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/view_models/content/content_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/feed_content_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/content/fetch_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/content_zero_state_widget.dart';
import 'package:myafyahub/presentation/content/widgets/feed_categories_widget.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:

class FeedPage extends StatefulWidget {
  const FeedPage();

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      final FeedContentState? state = StoreProvider.state<AppState>(context)
          ?.contentState
          ?.feedContentState;

      if (state?.contentItems?.isEmpty ?? true) {
        StoreProvider.dispatch<AppState>(
          context,
          FetchContentAction(context: context),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: libraryTitle, showBackButton: false),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              left: 12.0,
              bottom: 8.0,
              top: 4.0,
            ),
            child: FeedCategoriesWidget(),
          ),
          StoreConnector<AppState, ContentViewModel>(
            converter: (Store<AppState> store) =>
                ContentViewModel.fromStore(store.state),
            builder: (BuildContext context, ContentViewModel vm) {
              if (vm.wait!.isWaitingFor(fetchContentFlag)) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const SILPlatformLoader(),
                );
              } else if (vm.feedContentState?.timeoutFetchingContent ?? false) {
                return const GenericTimeoutWidget(
                  route: BWRoutes.home,
                  action: 'fetching your feed',
                );
              } else if (vm.feedContentState?.errorFetchingContent ?? false) {
                return GenericNoData(
                  key: helpNoDataWidgetKey,
                  type: GenericNoDataTypes.ErrorInData,
                  actionText: actionTextGenericNoData,
                  recoverCallback: () async {
                    StoreProvider.dispatch<AppState>(
                      context,
                      FetchContentAction(context: context),
                    );
                  },
                  messageBody: messageBodyGenericNoData,
                );
              } else {
                final List<Content?>? feedItems =
                    vm.feedContentState?.contentItems;

                if (feedItems != null && feedItems.isNotEmpty) {
                  return Flexible(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchContentAction(context: context),
                        );
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: feedItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Content currentFeedItem =
                              feedItems.elementAt(index)!;

                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 15 : 7.5,
                              bottom: 10,
                              right: 12,
                              left: 12,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: ContentItem(
                                contentDetails: currentFeedItem,
                                contentDisplayedType: ContentDisplayedType.FEED,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else if (feedItems != null) {
                  return ContentZeroStateWidget(
                    callBackFunction: () {
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchContentAction(
                          context: context,
                          category: vm.selectedCategory,
                        ),
                      );
                    },
                  );
                }
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
