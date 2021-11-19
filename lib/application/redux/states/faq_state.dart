import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_state.freezed.dart';
part 'faq_state.g.dart';

@freezed
class FAQState with _$FAQState {
  factory FAQState() = _FAQState;

  factory FAQState.fromJson(Map<String, dynamic> json) =>
      _$FAQStateFromJson(json);

  factory FAQState.initial() => FAQState();
}
