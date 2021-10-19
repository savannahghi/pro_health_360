// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';

class ExpandableContent extends StatelessWidget {
  ///
  /// [ExpandableContent] collects answers to secret questions.
  ///
  const ExpandableContent({
    required this.title,
    required this.content,
    this.color,
  });

  final Color? color;
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: white),
      child: InputDecorator(
        decoration: InputDecoration(
          fillColor: white,
          focusColor: Colors.grey[200],
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color ?? white),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Theme(
          data: ThemeData().copyWith(
            dividerColor: Colors.transparent,
            unselectedWidgetColor: black,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.black),
          ),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                iconColor: black,
                title: Text(
                  title,
                  style: const TextStyle(
                    color: black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                children: <Widget>[content],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
