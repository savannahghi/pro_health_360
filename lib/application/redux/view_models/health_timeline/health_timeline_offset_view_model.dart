import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';

class HealthTimelineOffsetViewModel extends Vm {
  final Wait wait;
  final int? offset;
  final int count;
  final VoidCallback? fetchMore;
  final void Function(int offset)? updateOffset;

  HealthTimelineOffsetViewModel({
    required this.wait,
    this.offset,
    this.count = 0,
    this.fetchMore,
    this.updateOffset,
  }) : super(equals: <Object?>[wait, offset, count]);
}
