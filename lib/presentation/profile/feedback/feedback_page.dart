// Flutter imports
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/send_feedback_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/medical_data/medical_data_item_title.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

// Package imports

// Project imports

class FeedbackPage extends StatefulWidget {
  /// [FeedbackPage] is used to get user feedback on app usage
  ///
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late FollowUpChoice followUpChoice = FollowUpChoice.Unknown;
  final TextEditingController feedBackInputController = TextEditingController();
  bool isMessageAvailable = false;
  bool requiresFollowUp = false;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: const CustomAppBar(title: feedbackString),
          body: (vm.wait!.isWaitingFor(sendFeedbackFlag))
              ? const PlatformLoader()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              largeVerticalSizedBox,
                              const MedicalDataItemTitle(
                                title: weValueFeedbackString,
                              ),
                              Text(
                                howToImproveExperienceString,
                                style: lightSize16Text(AppColors.greyTextColor)
                                    .copyWith(fontSize: 12),
                              ),
                              veryLargeVerticalSizedBox,
                              const MedicalDataItemTitle(
                                title: anyThoughtsToShareString,
                              ),
                              TextField(
                                key: feedbackTextFieldKey,
                                controller: feedBackInputController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 9,
                                minLines: 8,
                                onChanged: (String value) {
                                  setState(() {
                                    message = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              veryLargeVerticalSizedBox,
                              const MedicalDataItemTitle(
                                title: followUpOnFeedbackString,
                              ),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    key: yesButtonKey,
                                    onTap: () {
                                      setState(() {
                                        followUpChoice = FollowUpChoice.Yes;
                                        requiresFollowUp = true;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 14.0,
                                        right: 40.0,
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Radio<FollowUpChoice>(
                                              key: yesRadioButtonKey,
                                              activeColor:
                                                  AppColors.secondaryColor,
                                              value: FollowUpChoice.Yes,
                                              groupValue: followUpChoice,
                                              onChanged:
                                                  (FollowUpChoice? value) {
                                                setState(() {
                                                  followUpChoice = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          verySmallHorizontalSizedBox,
                                          Text(
                                            yesString,
                                            style: lightSize16Text(
                                              AppColors.greyTextColor,
                                            ).copyWith(
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  smallHorizontalSizedBox,
                                  GestureDetector(
                                    key: noButtonKey,
                                    onTap: () {
                                      setState(() {
                                        followUpChoice = FollowUpChoice.No;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 20,
                                            child: Radio<FollowUpChoice>(
                                              key: noRadioButtonKey,
                                              value: FollowUpChoice.No,
                                              groupValue: followUpChoice,
                                              onChanged:
                                                  (FollowUpChoice? value) {
                                                setState(() {
                                                  followUpChoice = value!;
                                                  requiresFollowUp = false;
                                                });
                                              },
                                              activeColor:
                                                  AppColors.secondaryColor,
                                            ),
                                          ),
                                          verySmallHorizontalSizedBox,
                                          Text(
                                            noString,
                                            style: lightSize16Text(
                                              AppColors.greyTextColor,
                                            ).copyWith(
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: MyAfyaHubPrimaryButton(
                                    buttonKey: sendFeedbackButtonKey,
                                    onPressed: message.isEmpty
                                        ? null
                                        : () async {
                                            await StoreProvider.dispatch<
                                                AppState>(
                                              context,
                                              SendFeedbackAction(
                                                client:
                                                    AppWrapperBase.of(context)!
                                                        .graphQLClient,
                                                message: feedBackInputController
                                                    .text,
                                                requiresFollowUp:
                                                    requiresFollowUp,
                                                onSuccess: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    AppRoutes
                                                        .successfulFeedbackSubmissionPage,
                                                  );
                                                },
                                                onError: () {
                                                  ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          feedbackSubmissionErrorText,
                                                        ),
                                                      ),
                                                    );
                                                },
                                              ),
                                            );
                                          },
                                    buttonColor:
                                        feedBackInputController.text.isNotEmpty
                                            ? AppColors.secondaryColor
                                            : Colors.grey,
                                    borderColor: Colors.transparent,
                                    text: sendFeedbackString,
                                    textStyle: normalSize14Text(Colors.white),
                                  ),
                                ),
                                smallHorizontalSizedBox,
                                SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: MyAfyaHubPrimaryButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    buttonKey: cancelFeedbackButtonKey,
                                    buttonColor: Colors.transparent,
                                    borderColor: AppColors.secondaryColor,
                                    text: cancelString,
                                    textStyle: normalSize14Text(
                                      AppColors.secondaryColor,
                                    ),
                                  ),
                                ),
                                largeVerticalSizedBox,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
