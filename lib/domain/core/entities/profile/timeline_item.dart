import 'package:myafyahub/domain/core/entities/profile/doctor.dart';

class TimelineItem {
  const TimelineItem({
    required this.leadingIcon,
    required this.title,
    required this.time,
    this.doctor,
    this.venue,
    this.file,
    this.fileType,
    this.attachmentUrl,
    bool? isDiary,
  }) : isDiary = isDiary ?? false;

  final String leadingIcon;
  final String title;
  final String time;
  final Doctor? doctor;
  final String? venue;
  final String? file;
  final AttachmentFileType? fileType;
  final String? attachmentUrl;
  final bool isDiary;
}

enum AttachmentFileType { file, image }
