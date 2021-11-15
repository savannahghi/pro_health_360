import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_pin.g.dart';

@JsonSerializable()
class CreatePIN {
  CreatePIN({
    required this.newPIN,
    required this.confirmPIN,
  });

  final String? newPIN;
  final String? confirmPIN;
  
  factory CreatePIN.fromJson(Map<String, dynamic> json) =>
      _$CreatePINFromJson(json);

  factory CreatePIN.initial() => CreatePIN(
        newPIN: UNKNOWN,
        confirmPIN: UNKNOWN,
      );


  Map<String, dynamic> toJson() => _$CreatePINToJson(this);
}
