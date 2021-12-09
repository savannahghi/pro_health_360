// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/bookmark_content_action.dart';
import 'package:myafyahub/application/redux/actions/content/fetch_bookmark_status_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/feed_content_view_model.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:unicons/unicons.dart';

/// [SaveFeedItemWidget] Displays reaction Icons on the feed
class SaveFeedItemWidget extends StatefulWidget {
  const SaveFeedItemWidget({
    Key? key,
    required this.contentID,
  }) : super(key: key);

  final int? contentID;

  @override
  State<SaveFeedItemWidget> createState() => _SaveFeedItemWidgetState();
}

class _SaveFeedItemWidgetState extends State<SaveFeedItemWidget> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await StoreProvider.dispatch<AppState>(
        context,
        FetchBookmarkStatusAction(
          context: context,
          contentID: widget.contentID!,
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeedContentViewModel>(
      converter: (Store<AppState> store) =>
          FeedContentViewModel.fromStore(store.state),
      builder: (BuildContext context, FeedContentViewModel vm) {
        final List<Content?> feedItems = vm.feedItems ?? <Content>[];
        final bool hasSaved = feedItems.isNotEmpty
            ? feedItems
                .firstWhere(
                  (Content? element) => element?.contentID == widget.contentID,
                  orElse: () => Content.initial(),
                )!
                .hasSaved!
            : false;
        return GestureDetector(
          onTap: () {
            if (!hasSaved) {
              StoreProvider.dispatch(
                context,
                BookmarkContentAction(
                  contentID: widget.contentID!,
                  context: context,
                ),
              );
            }
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: AppColors.unSelectedReactionBackgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //show the loader before the data is displayed
                if (vm.wait!.isWaitingFor(fetchBookmarkStatusFlag)) ...<Widget>{
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: SILPlatformLoader(),
                  ),
                } else ...<Widget>{
                  if (hasSaved)
                    const Icon(UniconsLine.check, size: 20)
                  else
                    SvgPicture.asset(
                      saveIconUrl,
                      width: 20,
                      height: 20,
                      color: AppColors.unSelectedReactionIconColor,
                    ),
                  smallHorizontalSizedBox,
                  Text(
                    hasSaved ? savedString : saveString,
                    style: TextThemes.boldSize13Text(AppColors.greyTextColor),
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
