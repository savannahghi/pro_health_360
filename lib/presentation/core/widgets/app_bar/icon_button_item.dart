import 'package:flutter/material.dart';

class IconButtonItem extends StatelessWidget {
  const IconButtonItem({
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
