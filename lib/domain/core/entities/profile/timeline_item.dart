class TimelineItem {
  const TimelineItem({
    required this.leadingIcon,
    required this.title,
    this.subtitle,
    this.time,
  });

  final String leadingIcon;
  final String title;
  final String? subtitle;
  final String? time;
}
