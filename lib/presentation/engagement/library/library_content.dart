// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:html/dom.dart' as dom;
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/connectivity_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import '../../../domain/core/entities/library/library_content_item.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({Key? key, required this.libraryContentItem})
      : super(key: key);

  final LibraryContentItemData libraryContentItem;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
        backgroundColor: themeData.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              key: libraryContentColumnKey,
              children: <Widget>[
                StoreConnector<AppState, ConnectivityViewModel>(
                  converter: (Store<AppState> store) =>
                      ConnectivityViewModel.fromStore(store),
                  builder: (BuildContext context, ConnectivityViewModel vm) {
                    return Stack(
                      children: <Widget>[
                        ClipRRect(
                          child: Align(
                            heightFactor: 1.0,
                            widthFactor: double.infinity,
                            child: libraryContentItem.libraryContentImageUrl ==
                                    ''
                                ? const SizedBox.shrink()
                                : Image.network(
                                    libraryContentItem.libraryContentImageUrl,
                                  ),
                          ),
                        ),
                        Positioned(
                          top: -10,
                          child: LibraryIconButton(
                            context: context,
                            backgroundColor: AppColors.whiteColor,
                            iconColor: AppColors.blackColor,
                          ),
                        )
                      ],
                    );
                  },
                ),
                verySmallVerticalSizedBox,
                if (libraryContentItem.libraryContentImageUrl.isEmpty)
                  Align(
                    alignment: Alignment.topLeft,
                    child: LibraryIconButton(
                      context: context,
                      backgroundColor: AppColors.lightPurpleCardBorder,
                      iconColor: AppColors.primaryColor,
                    ),
                  ),
                largeHorizontalSizedBox,
                Container(
                  key: libraryContentContainerKey,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              libraryContentItem.libraryContentTitle,
                              style: TextThemes.boldSize24Text(),
                              textAlign: TextAlign.start,
                            ),
                            verySmallVerticalSizedBox,
                            Row(
                              children: <Widget>[
                                sortDate(
                                  context: context,
                                  loadedDate: libraryContentItem
                                      .libraryContentPublishDate,
                                  dateTextStyle: TextThemes.normalSize12Text(
                                      AppColors.darkGreyColor),
                                ),
                                smallHorizontalSizedBox,
                                Text(
                                  '${libraryContentItem.libraryContentReadTime} min read',
                                  style: TextThemes.normalSize12Text(
                                      AppColors.darkGreyColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      mediumVerticalSizedBox,
                      Html(
                        data: libraryContentItem.libraryContentBodyText,
                        onLinkTap: (String? url,
                            RenderContext context,
                            Map<String, String> attributes,
                            dom.Element? element) {
                          launch(url!);
                        },
                        style: <String, Style>{
                          'li': Style(
                            lineHeight: LineHeight.em(1.5),
                            fontWeight: FontWeight.bold,
                            color: AppColors.greyColor,
                            listStylePosition: ListStylePosition.INSIDE,
                          ),
                          'a': Style(
                            textDecoration: TextDecoration.none,
                          ),
                          'p': Style(
                            lineHeight: LineHeight.em(1.5),
                            letterSpacing: 0.4,
                          ),
                          'iframe': Style(
                            height: 320,
                            width: double.infinity,
                          ),
                        },
                      ),
                      largeVerticalSizedBox,
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
