// Dart imports:

// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:myafyahub/application/redux/actions/fetch_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/content_view_model.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:

class FeedPage extends StatefulWidget {
  const FeedPage();

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final int _choiceIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchContentAction(context: context),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: libraryTitle, showBackButton: false),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _buildFeedFilters(context),
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
              } else if (vm.timeoutFetchingContent ?? false) {
                return const GenericTimeoutWidget(
                  route: BWRoutes.home,
                  action: 'fetching your feed',
                );
              } else if (vm.errorFetchingContent ?? false) {
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
                final List<Content?>? feedItems = vm.feedItems;

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
                          final Content? currentFeedItem =
                              feedItems.elementAt(index);
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 15 : 7.5,
                              bottom: 10,
                              right: 12,
                              left: 12,
                            ),
                            child:
                                ContentItem(contentDetails: currentFeedItem!),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }
            },
          ),
        ],
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
                StoreProvider.dispatch<AppState>(
                  context,
                  FetchContentAction(context: context),
                );
              },
              backgroundColor: Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}
