// Flutter imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/view_models/content/content_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/content/fetch_like_status_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [LikeContentWidget] Displays like status on the content details page
class LikeContentWidget extends StatefulWidget {
  const LikeContentWidget({
    Key? key,
    required this.contentID,
    required this.contentDisplayedType,
  }) : super(key: key);
  final int contentID;
  final ContentDisplayedType contentDisplayedType;

  @override
  State<LikeContentWidget> createState() => _LikeContentWidgetState();
}

class _LikeContentWidgetState extends State<LikeContentWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
      (Duration timeStamp) async {
        await StoreProvider.dispatch<AppState>(
          context,
          FetchLikeStatusAction(
            context: context,
            contentID: widget.contentID,
            contentDisplayedType: widget.contentDisplayedType,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ContentViewModel>(
      converter: (Store<AppState> store) =>
          ContentViewModel.fromStore(store.state),
      builder: (BuildContext context, ContentViewModel vm) {
         int count = getLikeCount(
          vm: vm,
          contentID: widget.contentID,
          contentDisplayedType: widget.contentDisplayedType,
        );
        final bool hasLiked = getHasLiked(
          contentID: widget.contentID,
          vm: vm,
          contentDisplayedType: widget.contentDisplayedType,
        );

        return GestureDetector(
          key: likeButtonKey,
          onTap: () async {
            setState(() {
              hasLiked ? count = count - 1 : count = count + 1;
            });
            await updateLikeStatus(
              contentID: widget.contentID,
              context: context,
              isLiked: hasLiked,
              updateLikeCount: true,
              contentDisplayedType: widget.contentDisplayedType,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 10.0,
            ),
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              color: hasLiked
                  ? AppColors.selectedReactionBackgroundColor
                  : AppColors.unSelectedReactionBackgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //show the loader before the data is displayed
                if (vm.wait!.isWaitingFor(fetchLikeStatusFlag)) ...<Widget>{
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: SILPlatformLoader(),
                  ),
                } else ...<Widget>{
                  SvgPicture.asset(
                    hasLiked ? selectedLikeIconSvgPath : heartIconUrl,
                    width: 20,
                    height: 20,
                    color: hasLiked
                        ? AppColors.reactionIconRedColor
                        : AppColors.unSelectedReactionIconColor,
                  ),
                  smallHorizontalSizedBox,
                  RichText(
                    text: TextSpan(
                      text: hasLiked ? '$count ' : '',
                      style: TextThemes.boldSize13Text(
                        hasLiked
                            ? AppColors.reactionIconRedColor
                            : AppColors.unSelectedReactionIconColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: hasLiked
                              ? '${likeString}s'
                              : '${likeString[0].toUpperCase()}${likeString.substring(1)}',
                        ),
                      ],
                    ),
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
