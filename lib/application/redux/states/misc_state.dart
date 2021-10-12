// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_error_state.dart';
import 'package:myafyahub/domain/core/entities/core/app_review_obj.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_obj.dart';
import 'package:myafyahub/domain/core/entities/login/phone_login.dart';
import 'package:myafyahub/domain/core/entities/login/phone_signup.dart';
import 'package:myafyahub/domain/core/entities/login/user_pin.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    PhoneLogin? phoneLogin,
    PhoneSignUp? phoneSignUp,
    UserPin? userPin,
    Set<AppErrorState>? appErrorState,
    BottomNavObj? bottomNavObj,
    List<dynamic>? libraryListItems,
    AppReviewObj? appReviewObj,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        phoneLogin: PhoneLogin.initial(),
        phoneSignUp: PhoneSignUp(),
        userPin: UserPin(),
        appErrorState: <AppErrorState>{},
        bottomNavObj: BottomNavObj(),
        libraryListItems: <dynamic>[],
        appReviewObj: AppReviewObj(),
      );
}
