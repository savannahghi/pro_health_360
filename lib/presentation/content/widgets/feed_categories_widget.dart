// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/content/fetch_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class FeedCategoriesWidget extends StatefulWidget {
  final ListContentCategory? listContentCategory;
  final Wait? wait;
  final ContentCategory? selectedCategory;

  const FeedCategoriesWidget({
    Key? key,
    required this.listContentCategory,
    required this.selectedCategory,
    this.wait,
  }) : super(key: key);
  @override
  State<FeedCategoriesWidget> createState() => _FeedCategoriesWidgetState();
}

class _FeedCategoriesWidgetState extends State<FeedCategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    List<ContentCategory?> contentCategories = <ContentCategory>[];
    if (widget.listContentCategory?.contentCategories?.isNotEmpty ?? false) {
      contentCategories = <ContentCategory?>[
        ContentCategory(icon: '', id: 0, name: 'all'),
        ...widget.listContentCategory!.contentCategories!
            .where(
              (ContentCategory? element) =>
                  element!.name!.toLowerCase() != 'welcome' &&
                  element.name!.toLowerCase() != 'consumer-faqs'&&
                  element.name!.toLowerCase() != 'pro-faqs',
            )
            .toList()
      ];
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          if (widget.wait?.isWaitingFor(fetchContentCategoriesFlag) ??
              false) ...<Widget>{
            Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              child: const PlatformLoader(),
            ),
          } else if (widget
                  .listContentCategory?.timeoutFetchingContentCategories ??
              false) ...<Widget>{
            const GenericTimeoutWidget(
              route: AppRoutes.home,
              action: 'fetching your content categories',
            )
          } else if (contentCategories.isNotEmpty) ...<Widget>{
            SizedBox(
              height: 42,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: contentCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  final ContentCategory contentCategory =
                      contentCategories[index]!;
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 1 : 7.5),
                    child: ChoiceChip(
                      avatar: getCategoryIcon(
                        index,
                        widget.selectedCategory,
                        contentCategory,
                      ),
                      label: Text(
                        toBeginningOfSentenceCase(contentCategory.name) ??
                            UNKNOWN,
                        style: normalSize16Text().copyWith(
                          color: widget.selectedCategory!.name ==
                                  contentCategory.name
                              ? AppColors.whiteColor
                              : AppColors.primaryColor,
                        ),
                      ),
                      labelStyle: const TextStyle(color: AppColors.whiteColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      selected:
                          widget.selectedCategory!.name == contentCategory.name,
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
              ),
            ),
          }
        ],
      ),
    );
  }

  Widget? getCategoryIcon(
    int index,
    ContentCategory? selectedCategory,
    ContentCategory contentCategory,
  ) {
    if (index == 0) {
      return Icon(
        Icons.grid_view_rounded,
        color: selectedCategory!.name == contentCategory.name
            ? AppColors.whiteColor
            : AppColors.primaryColor,
        size: 20.0,
      );
    } else {
      return (contentCategory.icon != null)
          ? Image.network(
              contentCategory.icon!,
              color: selectedCategory!.name == contentCategory.name
                  ? AppColors.whiteColor
                  : AppColors.primaryColor,
              width: 20,
              height: 20,
            )
          : null;
    }
  }
}
