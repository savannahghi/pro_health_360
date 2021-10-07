// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'app_error_state.freezed.dart';
part 'app_error_state.g.dart';

@freezed
class AppErrorState with _$AppErrorState {
  factory AppErrorState({
    final String? errorMessage,
    final bool? isError,
    final bool? isTimeout,
    final AppErrorType? appErrorType,
  }) = _AppErrorState;

  factory AppErrorState.fromJson(Map<String, dynamic> json) =>
      _$AppErrorStateFromJson(json);
}
