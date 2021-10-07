// Flutter imports:
import 'package:flutter/material.dart';

class ExpansionTileNoDividers extends StatelessWidget {
  final ExpansionTile child;

  const ExpansionTileNoDividers({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: child,
    );
  }
}
