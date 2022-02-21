// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/FAQS/fetch_faqs_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/FAQs/faqs_content_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/content/widgets/content_zero_state_widget.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/profile/faqs/faq_item.dart';
import 'package:myafyahub/presentation/router/routes.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';

class ProfileFaqsPage extends StatefulWidget {
  const ProfileFaqsPage();

  @override
  _ProfileFaqsPageState createState() => _ProfileFaqsPageState();
}

class _ProfileFaqsPageState extends State<ProfileFaqsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final FAQsContentState? state = StoreProvider.state<AppState>(context)
          ?.miscState
          ?.profileFAQsContentState;

      if (state?.profileFAQs?.isEmpty ?? true) {
        StoreProvider.dispatch<AppState>(
          context,
          // retrieve the FAQS
          FetchFAQSContentAction(
            context: context,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: faqsText),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    frequentlyAskedQuestions,
                    style: normalSize32Text(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  mediumVerticalSizedBox,
                  StoreConnector<AppState, FAQsContentViewModel>(
                    converter: (Store<AppState> store) =>
                        FAQsContentViewModel.fromStore(store.state),
                    builder: (BuildContext context, FAQsContentViewModel vm) {
                      if (vm.wait?.isWaitingFor(getFAQsFlag) ?? false) {
                        return Container(
                          height: 300,
                          padding: const EdgeInsets.all(20),
                          child: const SILPlatformLoader(),
                        );
                      } else if (vm.timeoutFetchingFAQs ?? false) {
                        return const GenericTimeoutWidget(
                          route: AppRoutes.home,
                          action: 'fetching Frequently Asked Questions',
                        );
                      } else if (vm.errorFetchingFAQs ?? false) {
                        return GenericNoData(
                          key: helpNoDataWidgetKey,
                          type: GenericNoDataTypes.ErrorInData,
                          actionText: actionTextGenericNoData,
                          recoverCallback: () async {
                            StoreProvider.dispatch<AppState>(
                              context,
                              FetchFAQSContentAction(context: context),
                            );
                          },
                          messageBody: messageBodyGenericNoData,
                        );
                      } else {
                        final List<FAQContent?>? faqsContent = vm.faqItems;

                        if ((faqsContent?.isNotEmpty ?? false) &&
                            (faqsContent != null)) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: faqsContent.length,
                            itemBuilder: (_, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.faqDetailViewPage,
                                    arguments: faqsContent[index],
                                  );
                                },
                                child: FAQItem(
                                  faqContent: FAQContent(
                                    title: faqsContent[index]?.title ?? UNKNOWN,
                                    body: loremIpsumText,
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (faqsContent != null) {
                          return ContentZeroStateWidget(
                            callBackFunction: () {
                              StoreProvider.dispatch<AppState>(
                                context,
                                FetchFAQSContentAction(
                                  context: context,
                                ),
                              );
                            },
                          );
                        }
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
