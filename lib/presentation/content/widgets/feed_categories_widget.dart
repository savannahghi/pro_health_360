// Dart imports:
import 'dart:async';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/content/fetch_content_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/content_view_model.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';
import 'package:myafyahub/domain/core/entities/feed/list_content_categories.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class FeedCategoriesWidget extends StatefulWidget {
  @override
  State<FeedCategoriesWidget> createState() => _FeedCategoriesWidgetState();
}

class _FeedCategoriesWidgetState extends State<FeedCategoriesWidget> {
  late Stream<Object> _stream;
  late StreamController<Object> _streamController;

  @override
  void initState() {
    _streamController = StreamController<Object>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await genericFetchFunction(
        streamController: _streamController,
        context: context,
        logTitle: 'Fetch Categories',
        queryString: getCategoriesQuery,
        variables: <String, dynamic>{},
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: StreamBuilder<dynamic>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //show the loader before the data is displayed
          if (snapshot.data is Map<String, dynamic> &&
              snapshot.data != null &&
              snapshot.data['loading'] != null &&
              snapshot.data['loading'] == true) {
            return Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              child: const PlatformLoader(),
            );
          }

          //error checking
          if (snapshot.hasError) {
            reportErrorToSentry(
              context,
              snapshot.error,
              hint: 'Error while fetching your content categories',
            );
            final dynamic valueHolder = snapshot.error;
            final Map<String, dynamic>? error = snapshot.error == null
                ? null
                : valueHolder as Map<String, dynamic>;

            /// check if the error is a timeout error and return an appropriate widget
            if (error == null || error['error'] == 'timeout') {
              return const GenericTimeoutWidget(
                route: AppRoutes.home,
                action: 'fetching your content categories',
              );
            }

            return GestureDetector(
              onTap: () async {
                await genericFetchFunction(
                  streamController: _streamController,
                  context: context,
                  logTitle: 'Fetch Categories',
                  queryString: getCategoriesQuery,
                  variables: <String, dynamic>{},
                );
              },
              child: Chip(
                label: Text(
                  contentCategoriesErrorMessage,
                  style: normalSize16Text(Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: AppColors.secondaryColor,
              ),
            );
          }

          if (snapshot.hasData) {
            final ListContentCategory listContentCategory =
                ListContentCategory.fromJson(
              snapshot.data as Map<String, dynamic>,
            );

            final List<ContentCategory?> contentCategories = <ContentCategory?>[
              ContentCategory(icon: '', id: 0, name: 'all'),
              ...listContentCategory.contentCategories!
                  .where(
                    (ContentCategory? element) =>
                        element!.name!.toLowerCase() != 'welcome',
                  )
                  .toList()
            ];

            if (contentCategories.isNotEmpty) {
              return StoreConnector<AppState, ContentViewModel>(
                converter: (Store<AppState> store) =>
                    ContentViewModel.fromStore(store.state),
                builder: (BuildContext context, ContentViewModel vm) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: contentCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ContentCategory contentCategory =
                          contentCategories[index]!;
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 1 : 7.5),
                        child: ChoiceChip(
                          avatar: getCategoryIcon(index, vm, contentCategory),
                          label: Text(
                            toBeginningOfSentenceCase(contentCategory.name) ??
                                UNKNOWN,
                            style: normalSize16Text().copyWith(
                              color: vm.selectedCategory!.name ==
                                      contentCategory.name
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColor,
                            ),
                          ),
                          labelStyle:
                              const TextStyle(color: AppColors.whiteColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          selected:
                              vm.selectedCategory!.name == contentCategory.name,
                          selectedColor: AppColors.primaryColor,
                          onSelected: (bool selected) {
                            StoreProvider.dispatch<AppState>(
                              context,
                              FetchContentAction(
                                context: context,
                                category: contentCategory,
                              ),
                            );
                          },
                          backgroundColor: Colors.grey.shade300,
                        ),
                      );
                    },
                  );
                },
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget? getCategoryIcon(
    int index,
    ContentViewModel vm,
    ContentCategory contentCategory,
  ) {
    if (index == 0) {
      return Icon(
        Icons.grid_view_rounded,
        color: vm.selectedCategory!.name == contentCategory.name
            ? AppColors.whiteColor
            : AppColors.primaryColor,
        size: 20.0,
      );
    } else {
      return (contentCategory.icon != null)
          ? Image.network(
              contentCategory.icon!,
              color: vm.selectedCategory!.name == contentCategory.name
                  ? AppColors.whiteColor
                  : AppColors.primaryColor,
              width: 20,
              height: 20,
            )
          : null;
    }
  }
}
