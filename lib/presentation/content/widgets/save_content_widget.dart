// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/content/fetch_bookmark_status_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/feed_content_view_model.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [SaveContentWidget] Displays reaction Icons on the feed
class SaveContentWidget extends StatefulWidget {
  const SaveContentWidget({Key? key, required this.contentID})
      : super(key: key);
  final int contentID;

  @override
  _SaveContentWidgetState createState() => _SaveContentWidgetState();
}

class _SaveContentWidgetState extends State<SaveContentWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      await StoreProvider.dispatch<AppState>(
        context,
        FetchBookmarkStatusAction(
          context: context,
          contentID: widget.contentID,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FeedContentViewModel>(
      converter: (Store<AppState> store) =>
          FeedContentViewModel.fromStore(store.state),
      builder: (BuildContext context, FeedContentViewModel vm) {
        final bool hasSaved = getHasSaved(
          feedItems: vm.feedItems ?? <Content>[],
          contentID: widget.contentID,
        );
        return GestureDetector(
          onTap: () async {
            if (!hasSaved) {
              await updateBookmarkStatus(
                contentID: widget.contentID,
                context: context,
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
