import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';

class FAQsContentViewModel extends Vm {
  FAQsContentViewModel({
    this.wait,
    this.errorFetchingFAQs,
    this.timeoutFetchingFAQs,
    this.faqItems,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingFAQs,
            timeoutFetchingFAQs,
            faqItems,
          ],
        );

  factory FAQsContentViewModel.fromStore(AppState state) {
    return FAQsContentViewModel(
      wait: state.wait,
      errorFetchingFAQs:
          state.miscState!.profileFAQsContentState!.errorFetchingFAQs,
      timeoutFetchingFAQs:
          state.miscState!.profileFAQsContentState!.timeoutFetchingFAQs,
      faqItems: state.miscState!.profileFAQsContentState!.profileFAQs,
    );
  }

  final bool? errorFetchingFAQs;
  final bool? timeoutFetchingFAQs;
  final List<FAQContent?>? faqItems;
  final Wait? wait;
}
