// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/fetch_saved_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';

import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/saved_content_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/saved_content_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/profile/saved_posts/widgets/no_saved_content_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Package imports:

class SavedPostPage extends StatefulWidget {
  @override
  State<SavedPostPage> createState() => _SavedPostPageState();
}

class _SavedPostPageState extends State<SavedPostPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      final SavedContentState? state =
          StoreProvider.state<AppState>(context)?.savedContentState;

      if (state?.savedContentItems?.isEmpty ?? false) {
        StoreProvider.dispatch<AppState>(
          context,
          FetchSavedContentAction(
            context: context,
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: savedText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: StoreConnector<AppState, SavedContentViewModel>(
          converter: (Store<AppState> store) =>
              SavedContentViewModel.fromStore(store.state),
          builder: (BuildContext context, SavedContentViewModel vm) {
            if (vm.wait!.isWaitingFor(fetchSavedContentFlag)) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const SILPlatformLoader(),
              );
            } else if (vm.timeoutFetchingContent ?? false) {
              return const GenericTimeoutWidget(
                route: BWRoutes.userProfilePage,
                action: 'fetching your saved content',
              );
            } else if (vm.errorFetchingContent ?? false) {
              return GenericNoData(
                key: helpNoDataWidgetKey,
                type: GenericNoDataTypes.ErrorInData,
                actionText: actionTextGenericNoData,
                recoverCallback: () async {
                  StoreProvider.dispatch<AppState>(
                    context,
                    FetchSavedContentAction(context: context),
                  );
                },
                messageBody: messageBodyGenericNoData,
              );
            } else {
              final List<Content?>? savedItems = vm.savedItems;

              if (savedItems != null && savedItems.isNotEmpty) {
                return RefreshIndicator(
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
                      final Content? currentSavedItem =
                          savedItems.elementAt(index);
                      return Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 15 : 7.5,
                          bottom: 10,
                          right: 12,
                          left: 12,
                        ),
                        child: ContentItem(contentDetails: currentSavedItem!),
                      );
                    },
                  ),
                );
              } else if (savedItems != null) {
                return const NoSavedContentWidget();
              }
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
