// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/app_review_obj.dart';

class AppReviewAction extends ReduxAction<AppState> {
  AppReviewAction(
      {this.launches, this.days, this.lastLaunchDate, this.shouldRateApp});

  final int? launches;
  final int? days;
  final String? lastLaunchDate;
  final bool? shouldRateApp;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith.miscState!.call(
        appReviewObj: AppReviewObj(
            launches: launches,
            days: days,
            lastLaunchDate: lastLaunchDate,
            shouldRateApp: shouldRateApp));
    return newState;
  }
}
