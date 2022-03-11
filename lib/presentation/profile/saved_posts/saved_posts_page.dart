// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/view_models/content/content_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/fetch_saved_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/saved_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/profile/saved_posts/widgets/no_saved_content_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class SavedPostPage extends StatefulWidget {
  const SavedPostPage();

  @override
  State<SavedPostPage> createState() => _SavedPostPageState();
}

class _SavedPostPageState extends State<SavedPostPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      final SavedContentState? state = StoreProvider.state<AppState>(context)
          ?.contentState
          ?.savedContentState;

      if (state?.savedContentItems?.isEmpty ?? true) {
        StoreProvider.dispatch<AppState>(
          context,
          FetchSavedContentAction(
            context: context,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: mySavedContentText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, ContentViewModel>(
            converter: (Store<AppState> store) =>
                ContentViewModel.fromStore(store.state),
            builder: (BuildContext context, ContentViewModel vm) {
              if (vm.wait!.isWaitingFor(fetchSavedContentFlag)) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const PlatformLoader(),
                );
              } else if (vm.savedContentState?.timeoutFetchingContent ??
                  false) {
                return const GenericTimeoutWidget(
                  route: AppRoutes.userProfilePage,
                  action: 'fetching your saved content',
                );
              } else if (vm.savedContentState?.errorFetchingContent ?? false) {
                return GenericErrorWidget(
                  actionKey: helpNoDataWidgetKey,
                  recoverCallback: () async {
                    StoreProvider.dispatch<AppState>(
                      context,
                      FetchSavedContentAction(context: context),
                    );
                  },
                  messageTitle: savedContentErrorTitleText,
                  messageBody: const <TextSpan>[
                    TextSpan(text: savedContentErrorBodyText)
                  ],
                );
              } else {
                final List<Content?>? savedItems =
                    vm.savedContentState?.savedContentItems;

                if (savedItems != null && savedItems.isNotEmpty) {
                  return Flexible(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        StoreProvider.dispatch<AppState>(
                          context,
                          FetchSavedContentAction(context: context),
                        );
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: savedItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Content currentSavedItem =
                              savedItems.elementAt(index)!;

                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 15 : 7.5,
                              bottom: 10,
                              right: 12,
                              left: 12,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.38,
                              child: ContentItem(
                                contentDetails: currentSavedItem,
                                contentDisplayedType:
                                    ContentDisplayedType.BOOKMARK,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else if (savedItems != null) {
                  return const Flexible(child: NoSavedContentWidget());
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
