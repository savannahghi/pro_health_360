// Flutter imports
import 'package:flutter/material.dart';

// Project imports
import 'package:myafyahub/presentation/core/theme/theme.dart';

class MoodFilterChip extends StatefulWidget {
  /// [MoodFilterChip] is used to get more context of patients current mood.
  ///
  const MoodFilterChip({Key? key, required this.labelText}) : super(key: key);

  final String labelText;

  @override
  State<MoodFilterChip> createState() => _MoodFilterChipState();
}

class _MoodFilterChipState extends State<MoodFilterChip> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.labelText,
        style: const TextStyle(
          color: AppColors.whiteColor,
        ),
      ),
      backgroundColor: AppColors.blueChillColor,
      selected: selected,
      onSelected: (bool value) {
        setState(() {
          selected = value;
        });
      },
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.whiteColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      pressElevation: 15,
      selectedColor: AppColors.javaColor,
      checkmarkColor: AppColors.whiteColor,
    );
  }
}
