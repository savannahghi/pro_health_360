import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

class ModerationActionsViewModel extends Vm {
  final Wait wait;
  final VoidCallback? unBan;
  final VoidCallback? ban;
  final VoidCallback? promote;
  final VoidCallback? remove;

  ModerationActionsViewModel({
    required this.wait,
    this.unBan,
    this.ban,
    this.promote,
    this.remove,
  }) : super(equals: <Object?>[wait]);
}
