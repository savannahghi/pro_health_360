// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/faqs_content_state.dart';
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';

class UpdateFAQsContentAction extends ReduxAction<AppState> {
  UpdateFAQsContentAction({
    this.profileFAQs,
    this.errorFetchingFAQs,
    this.timeoutFetchingFAQs,
  });

  final List<FAQContent?>? profileFAQs;
  final bool? errorFetchingFAQs;
  final bool? timeoutFetchingFAQs;

  @override
  AppState reduce() {
    final FAQsContentState? newFAQsContentState =
        state.miscState?.profileFAQsContentState?.copyWith(
      profileFAQs:
          profileFAQs ?? state.miscState?.profileFAQsContentState?.profileFAQs,
      errorFetchingFAQs: errorFetchingFAQs ??
          state.miscState?.profileFAQsContentState?.errorFetchingFAQs,
      timeoutFetchingFAQs: timeoutFetchingFAQs ??
          state.miscState?.profileFAQsContentState?.timeoutFetchingFAQs,
    );

    return state.copyWith(
      miscState: state.miscState?.copyWith(
        profileFAQsContentState: newFAQsContentState,
      ),
    );
  }
}
