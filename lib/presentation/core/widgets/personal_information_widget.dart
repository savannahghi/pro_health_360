import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_themes/text_themes.dart';

class PersonalInformationWidget extends StatelessWidget {
  final String description;

  const PersonalInformationWidget({
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
        color: Colors.white,
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description, style: TextThemes.normalSize14Text()),
          )),
    );
  }
}