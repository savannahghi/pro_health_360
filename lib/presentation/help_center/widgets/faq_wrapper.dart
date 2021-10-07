// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/misc.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/faq_list_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/faq_content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/help_center/help_center_question_card.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/widgets/text_loading_shimmer.dart';

class FAQWrapper extends StatefulWidget {
  @override
  _FAQWrapperState createState() => _FAQWrapperState();
}

class _FAQWrapperState extends State<FAQWrapper> {
  late Stream<Object> _stream;
  late StreamController<Object> _streamController;

  @override
  void initState() {
    _streamController = StreamController<Object>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await fetchData();
    });
    super.initState();
  }

  Future<void> fetchData() async {
    await genericFetchFunction(
      streamController: _streamController,
      context: context,
      logTitle: logTitle,
      queryString: getFAQQuery,
      variables: <String, dynamic>{'flavour': Flavour.CONSUMER.name},
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //show the loader before the data is displayed
        if (snapshot.data is Map<String, dynamic> &&
            snapshot.data != null &&
            snapshot.data['loading'] != null &&
            snapshot.data['loading'] == true) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextLoadingShimmer(),
          );
        }

        //error checking
        if (snapshot.hasError) {
          reportErrorToSentry(context, snapshot.error,
              hint: 'Timeout fetching FAQs');
          final dynamic valueHolder = snapshot.error;
          final Map<String, dynamic>? error = snapshot.error == null
              ? null
              : valueHolder as Map<String, dynamic>;

          /// check if the error is a timeout error and return an appropriate widget
          if (error == null || error['error'] == 'timeout') {
            return GenericTimeoutWidget(
              route: BWRoutes.home,
              action: 'getting FAQs',
              recoverCallback: () async {
                await fetchData();
              },
            );
          }

          return GenericNoData(
              key: helpNoDataWidgetKey,
              type: GenericNoDataTypes.ErrorInData,
              actionText: actionTextGenericNoData,
              recoverCallback: () async {
                await fetchData();
              },
              messageBody: messageBodyGenericNoData);
        }

        if (snapshot.hasData) {
          if (snapshot.data != null) {
            final FAQContentRelay faqRelay =
                FAQContentRelay.fromJson(snapshot.data as Map<String, dynamic>);

            final List<FAQContent?>? faqs = faqRelay.faqs;

            StoreProvider.dispatch(
              context,
              FaqListAction(faqList: faqs),
            );

            if (faqs!.isEmpty == true) {
              // return an empty state widget here
              return const Center(
                  child: GenericEmptyData(item: itemGenericEmptyData));
            }

            return StoreConnector<AppState, AppStateViewModel>(
              converter: (Store<AppState> store) =>
                  AppStateViewModel.fromStore(store),
              builder: (BuildContext context, AppStateViewModel vm) {
                final List<FAQContent?>? faqsFromState =
                    vm.appState.miscState!.faqList;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: faqs.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final String faqQuestion = faqs[index]!.title!;
                    final String? faqQuestionFromState =
                        faqsFromState![index]!.title;

                    final String faqAnswer = faqs[index]!.html!;

                    final String? faqAnswerFromState =
                        faqsFromState[index]!.html;
                    if (faqs[index]!.tags![0]!.name!.contains('consumer')) {
                      return HelpCenterQuestionCard(
                        question: faqQuestionFromState ?? faqQuestion,
                        answer: faqAnswerFromState ?? faqAnswer,
                      );
                    }
                    return const SizedBox();
                  },
                );
              },
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}
