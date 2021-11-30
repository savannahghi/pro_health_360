// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/redux/actions/bookmark_content_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

/// [SaveFeedItemWidget] Displays reaction Icons on the feed
class SaveFeedItemWidget extends StatefulWidget {
  const SaveFeedItemWidget({this.saved = false, required this.contentID});

  final bool saved;
  final int? contentID;

  @override
  State<SaveFeedItemWidget> createState() => _SaveFeedItemWidgetState();
}

class _SaveFeedItemWidgetState extends State<SaveFeedItemWidget> {
  late bool _saved = widget.saved;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: saveButtonKey,
      onTap: () {
        //TODO: Save feed item
        if (!_saved) {
          setState(() {
            _saved = true;
          });
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
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: AppColors.unSelectedReactionBackgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_saved)
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
              _saved ? savedString : saveString,
              style: TextThemes.boldSize13Text(
                widget.saved
                    ? AppColors.greyTextColor
                    : AppColors.unSelectedReactionIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
