import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:myafyahub/domain/core/entities/profile/doctor.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/information_list_card.dart';
import 'package:myafyahub/presentation/profile/widgets/dashed_line.dart';
import 'package:shared_themes/text_themes.dart';

class MyHealthTimeline extends StatefulWidget {
  const MyHealthTimeline({Key? key}) : super(key: key);

  @override
  State<MyHealthTimeline> createState() => _MyHealthTimelineState();
}

class _MyHealthTimelineState extends State<MyHealthTimeline> {
  Map<String, Key> keys = <String, Key>{};

  List<OverlayEntry> entries = <OverlayEntry>[];

  Map<String, double> heights = <String, double>{};

  bool hasDoneCalculation = false;

  @override
  void initState() {
    super.initState();

    for (final String date in timelineItems.keys.toList()) {
      final GlobalObjectKey<State<StatefulWidget>> widgetKey =
          GlobalObjectKey(date);

      keys[date] = widgetKey;
    }

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      calculateHeights();
    });
  }

  void calculateHeights() {
    for (final String date in timelineItems.keys.toList()) {
      final GlobalObjectKey<State<StatefulWidget>> widgetKey =
          keys[date]! as GlobalObjectKey<State<StatefulWidget>>;

      final BuildContext? keyContext = widgetKey.currentContext;

      if (keyContext != null) {
        final RenderBox? box = keyContext.findRenderObject() as RenderBox?;

        heights[date] = box?.size.height ?? 1.0;
      }
    }

    setState(() {
      hasDoneCalculation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = timelineItems.keys.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          myHealthTimelineText,
          style: TextThemes.boldSize14Text(AppColors.greyTextColor),
        ),
        const SizedBox(height: 20),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final String key = items[index];

            final DateTime date = DateFormat('dd/MM/yy').parse(key);

            double height = heights[key] ?? 1;

            if (hasDoneCalculation && index == 0) {
              height = heights[key]! * 0.8;
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              key: keys[key],
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 24),
                      TimelineIndicator(date: date),
                    ],
                  ),
                ),
                if (hasDoneCalculation)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: index == 0 ? height * 0.3 : 0.0,
                        right: 12.0,
                      ),
                      child: CustomPaint(
                        size: Size(1, height),
                        painter: DashedLine(
                          dotOffset: index != 0 ? 44.0 : 0.0,
                          dashSize: 5,
                          gapSize: 2,
                          color: AppColors.timelineDotColor,
                        ),
                      ),
                    ),
                  ),
                Flexible(
                  flex: 8,
                  child: Column(
                    children: getItemCards(timelineItems[key]!),
                  ),
                ),
              ],
            );
          },
          itemCount: items.length,
        ),
      ],
    );
  }

  List<Widget> getItemCards(List<TimelineItem> items) {
    final List<Widget> results = <Widget>[];

    for (final TimelineItem item in items) {
      results.add(
        InformationListCard(
          borderRadius: 12,
          alternateLeadingIcon: Container(
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
          iconBackgroundColor:
              item.isDiary ? AppColors.diaryListCardColor : null,
          title: Text(
            item.title,
            style: TextThemes.normalSize12Text(AppColors.timelineDotColor),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...getItemContent(item),
              const SizedBox(height: 4),
              Text(
                item.time,
                style: TextThemes.normalSize10Text(AppColors.greyTextColor),
              ),
            ],
          ),
        ),
      );
      results.add(const SizedBox(height: 10));
    }

    return results;
  }

  List<Widget> getItemContent(TimelineItem item) {
    final List<Widget> content = <Widget>[];

    if (item.doctor != null) {
      final String? firstName = item.doctor?.firstName.getValue();
      final String? lastName = item.doctor?.lastName.getValue();
      final String venue = item.venue!;

      content.add(
        Row(
          children: <Widget>[
            Text(
              'Dr $firstName $lastName',
              style: TextThemes.normalSize10Text(AppColors.greyTextColor),
            ),
            const SizedBox(width: 8),
            Text(
              venue,
              style: TextThemes.normalSize10Text(AppColors.greyTextColor),
            ),
          ],
        ),
      );
    }

    return content;
  }
}

class TimelineIndicator extends StatelessWidget {
  const TimelineIndicator({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                date.day.toString(),
                style: TextThemes.boldSize22Text(AppColors.greyTextColor),
              ),
              Text(
                '${date.month}/${date.year}',
                style: TextThemes.normalSize10Text(AppColors.greyTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineItem {
  const TimelineItem({
    required this.leadingIcon,
    required this.title,
    required this.time,
    this.doctor,
    this.venue,
    this.file,
    this.fileType,
    bool? isDiary,
  }) : isDiary = isDiary ?? false;

  final String leadingIcon;
  final String title;
  final String time;
  final Doctor? doctor;
  final String? venue;
  final String? file;
  final String? fileType;
  final bool isDiary;
}

final Map<String, List<TimelineItem>> timelineItems =
    <String, List<TimelineItem>>{
  '10/07/21': <TimelineItem>[
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
    ),
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
      isDiary: true,
    ),
  ],
  '01/07/21': <TimelineItem>[
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
    ),
  ],
  '18/06/21': <TimelineItem>[
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
    ),
    TimelineItem(
      leadingIcon: 'syringe',
      title: 'Bloodwork',
      doctor: Doctor(
        firstName: Name.withValue('James'),
        lastName: Name.withValue('Jerms'),
      ),
      venue: 'Stay Well Center',
      time: '12:00pm',
      isDiary: true,
    ),
  ],
};
