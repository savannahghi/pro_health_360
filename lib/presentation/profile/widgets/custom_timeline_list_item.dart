import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/entities/profile/timeline_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class CustomTimelineListItem extends StatelessWidget {
  const CustomTimelineListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final TimelineItem item;

  @override
  Widget build(BuildContext context) {
    Widget? image;

    if (item.attachmentUrl != null &&
        item.fileType == AttachmentFileType.image) {
      image = CachedNetworkImage(
        width: 400,
        height: 200,
        placeholder: (BuildContext context, String url) {
          return SvgPicture.asset(
            placeholderImageUrl,
          );
        },
        imageUrl: 'https://picsum.photos/1000/650?image=9',
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: item.isDiary
                      ? AppColors.diaryListCardColor
                      : AppColors.listCardColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/${item.leadingIcon}.svg',
                  color: AppColors.timelineDotColor,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        item.title,
                        style: TextThemes.normalSize12Text(
                          AppColors.timelineDotColor,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ...getItemContent(item),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.time,
                          style: TextThemes.normalSize10Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (image != null) smallVerticalSizedBox,
          image ?? Container(),
        ],
      ),
    );
  }

  List<Widget> getItemContent(TimelineItem item) {
    final List<Widget> content = <Widget>[];

    if (item.attachmentUrl != null) {
      final String fileTypeText = item.fileType == AttachmentFileType.file
          ? textEntryText
          : imageFileText;

      content.addAll(
        <Widget>[
          SvgPicture.asset(
            attachmentIconSvg,
            color: AppColors.greyTextColor,
          ),
          const SizedBox(width: 4),
          Text(
            fileTypeText,
            style: TextThemes.normalSize10Text(AppColors.greyTextColor),
          ),
        ],
      );
    } else if (item.doctor != null) {
      final String? firstName = item.doctor?.firstName.getValue();
      final String? lastName = item.doctor?.lastName.getValue();
      final String venue = item.venue!;

      content.addAll(
        <Widget>[
          Text(
            getDoctorName(firstName, lastName),
            style: TextThemes.normalSize10Text(AppColors.greyTextColor),
          ),
          const SizedBox(width: 8),
          Text(
            venue,
            style: TextThemes.normalSize10Text(AppColors.greyTextColor),
          ),
        ],
      );
    }

    return content;
  }
}
