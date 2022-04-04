// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/profile/timeline_item.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class CustomTimelineListItem extends StatelessWidget {
  const CustomTimelineListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final TimelineItem item;

  @override
  Widget build(BuildContext context) {
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
                  color: AppColors.listCardColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  item.leadingIcon,
                  color: AppColors.timelineDotColor,
                  width: 35,
                  height: 35,
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
                        style: normalSize12Text(
                          AppColors.timelineDotColor,
                        ),
                      ),
                    ),
                    if (item.subtitle != null) ...<Widget>[
                      const SizedBox(height: 4),
                      Text(
                        item.subtitle!,
                        style: normalSize10Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    ],
                    if (item.time != null) ...<Widget>[
                      const SizedBox(height: 4),
                      humanizeDate(
                        dateTextStyle:
                            normalSize10Text(AppColors.greyTextColor),
                        loadedDate: item.time!,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
