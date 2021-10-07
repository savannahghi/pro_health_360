// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/faq_content.dart';

class FaqListAction extends ReduxAction<AppState> {
  FaqListAction({required this.faqList});

  final List<FAQContent?>? faqList;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith.miscState!.call(faqList: this.faqList);
    return newState;
  }
}
