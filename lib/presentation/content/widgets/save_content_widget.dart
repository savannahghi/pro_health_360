// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/actions/content/fetch_bookmark_status_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/content/content_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

/// [SaveContentWidget] Displays like status on the content details page
class SaveContentWidget extends StatefulWidget {
  const SaveContentWidget({
    Key? key,
    required this.contentID,
    required this.contentDisplayedType,
  }) : super(key: key);
  final int contentID;
  final ContentDisplayedType contentDisplayedType;

  @override
  State<SaveContentWidget> createState() => _SaveContentWidgetState();
}

class _SaveContentWidgetState extends State<SaveContentWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
      (Duration timeStamp) async {
        await StoreProvider.dispatch<AppState>(
          context,
          FetchBookmarkStatusAction(
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
        final bool hasSaved = getHasSaved(
          vm: vm,
          contentID: widget.contentID,
          contentDisplayedType: widget.contentDisplayedType,
        );

        return GestureDetector(
          key: saveButtonKey,
          onTap: () async {
            if (!hasSaved) {
              setState(() {});
              await updateBookmarkStatus(
                contentID: widget.contentID,
                context: context,
                contentDisplayedType: widget.contentDisplayedType,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 10.0,
            ),
            margin: const EdgeInsets.only(right: 15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
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
                    child: PlatformLoader(),
                  ),
                } else ...<Widget>{
                  SvgPicture.asset(
                    hasSaved ? doneIconUrl : saveIconUrl,
                    width: 20,
                    height: 20,
                    color: AppColors.unSelectedReactionIconColor,
                  ),
                  smallHorizontalSizedBox,
                  RichText(
                    text: TextSpan(
                      text: hasSaved ? savedString : saveString,
                      style: boldSize13Text(
                        AppColors.unSelectedReactionIconColor,
                      ),
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
