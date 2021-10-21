import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pin.g.dart';

@JsonSerializable()
class ChangePIN {
  ChangePIN({
    required this.createPIN,
    required this.confirmPIN,
    this.invalidCredentials = false,
  });

  final String? confirmPIN;
  final String? createPIN;
  final bool invalidCredentials;
  
  factory ChangePIN.fromJson(Map<String, dynamic> json) =>
      _$ChangePINFromJson(json);

  factory ChangePIN.initial() => ChangePIN(
        createPIN: UNKNOWN,
        confirmPIN: UNKNOWN,
      );


  Map<String, dynamic> toJson() => _$ChangePINToJson(this);
}
