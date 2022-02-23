// Dart imports:
import 'dart:async';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/feed_content.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/infrastructure/connecitivity/connectivity_interface.dart';
import 'package:myafyahub/infrastructure/connecitivity/mobile_connectivity_status.dart';
import 'package:myafyahub/presentation/content/widgets/mini_content_widget.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

class SetNickNamePage extends StatefulWidget {
  SetNickNamePage({ConnectivityStatus? connectivityStatus})
      : connectivityStatus = connectivityStatus ?? MobileConnectivityStatus();

  final ConnectivityStatus connectivityStatus;
  @override
  _SetNickNamePageState createState() => _SetNickNamePageState();
}

class _SetNickNamePageState extends State<SetNickNamePage> {
  String? nickName;
  TextEditingController userNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Stream<dynamic> _stream;
  late StreamController<dynamic> _streamController;

  @override
  void initState() {
    _streamController = StreamController<dynamic>.broadcast();
    _stream = _streamController.stream;
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      await genericFetchFunction(
        streamController: _streamController,
        context: context,
        logTitle: 'Fetch welcome content',
        queryString: getContentQuery,
        variables: <String, dynamic>{
          'Limit': '3',
          'categoryID': 1,
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 4;
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final bool waitingForFlag =
            vm.appState.wait!.isWaitingFor(setNickNameFlag);
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: sizedBoxHeight,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mediumVerticalSizedBox,
                          Text(
                            setNickNamePageTitle(context: context),
                            style: boldSize30Text(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          smallVerticalSizedBox,
                          Text(
                            congratulationsPageDescription,
                            style: lightSize16Text(Colors.grey),
                          ),
                          smallVerticalSizedBox,
                        ],
                      ),
                      smallVerticalSizedBox,
                      SizedBox(
                        child: Column(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      nickNameString,
                                      style: boldSize14Text(
                                        AppColors.greyTextColor,
                                      ),
                                    ),
                                  ),
                                  verySmallVerticalSizedBox,
                                  CustomTextField(
                                    formFieldKey: nameInputKey,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    borderColor: Colors.grey[200],
                                    maxLines: 1,
                                    keyboardType: TextInputType.name,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return nameInputValidateString;
                                      }
                                    },
                                    onChanged: (String val) {
                                      setState(() {
                                        nickName = val;
                                      });
                                    },
                                  ),
                                  StreamBuilder<dynamic>(
                                    stream: _stream,
                                    builder: (
                                      BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot,
                                    ) {
                                      //show the loader before the data is displayed
                                      if (snapshot.data
                                              is Map<String, dynamic> &&
                                          snapshot.data != null &&
                                          snapshot.data['loading'] != null &&
                                          snapshot.data['loading'] == true) {
                                        return Container(
                                          height: 200,
                                          padding: const EdgeInsets.all(20),
                                          child: const SILPlatformLoader(),
                                        );
                                      }

                                      //error checking
                                      if (snapshot.hasError) {
                                        reportErrorToSentry(
                                          context,
                                          snapshot.error,
                                          hint:
                                              'Error fetching welcome content',
                                        );
                                        return GenericNoData(
                                          key: helpNoDataWidgetKey,
                                          type: GenericNoDataTypes.ErrorInData,
                                          actionText: actionTextGenericNoData,
                                          recoverCallback: () async {
                                            await genericFetchFunction(
                                              streamController:
                                                  _streamController,
                                              context: context,
                                              logTitle: 'Fetch welcome content',
                                              queryString: getContentQuery,
                                              variables: <String, dynamic>{
                                                'Limit': '3',
                                                'categoryID': 1,
                                              },
                                            );
                                          },
                                          messageBody: messageBodyGenericNoData,
                                        );
                                      }
                                      if (snapshot.hasData) {
                                        final FeedContent welcomeContent =
                                            FeedContent.fromJson(
                                          snapshot.data as Map<String, dynamic>,
                                        );
                                        final List<Content?>? links =
                                            welcomeContent.feedContent?.items;
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            if (links?.isNotEmpty ?? false)
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  veryLargeVerticalSizedBox,
                                                  smallVerticalSizedBox,
                                                  Text(
                                                    importantInformationString,
                                                    style: TextThemes
                                                        .boldSize16Text(
                                                      AppColors.secondaryColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    height: 250,
                                                    child: ListView.builder(
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: links?.length,
                                                      itemBuilder: (
                                                        BuildContext context,
                                                        int index,
                                                      ) {
                                                        final Content?
                                                            currentLink =
                                                            links!.elementAt(
                                                          index,
                                                        );

                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 5,
                                                          ),
                                                          child:
                                                              MiniContentWidget(
                                                            contentDetails:
                                                                currentLink,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            if (waitingForFlag) ...<Widget>{
                              veryLargeVerticalSizedBox,
                              const SILPlatformLoader(
                                color: AppColors.secondaryColor,
                              ),
                            },
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 52,
            child: (vm.appState.wait!.isWaitingFor(setNickNameFlag))
                ? const SILPlatformLoader()
                : MyAfyaHubPrimaryButton(
                    buttonKey: continueKey,
                    onPressed: () async {
                      final bool hasConnection =
                          await widget.connectivityStatus.checkConnection();
                      final bool? isFormValid =
                          _formKey.currentState?.validate();
                      if (!hasConnection) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(noInternetConnection),
                          ),
                        );
                        return;
                      }
                      if (isFormValid != null &&
                          isFormValid &&
                          nickName != null) {
                        setUserNickname(
                          nickName: nickName ?? '',
                          context: context,
                        );
                      }
                    },
                    buttonColor:
                        waitingForFlag ? Colors.grey : AppColors.secondaryColor,
                    borderColor:
                        waitingForFlag ? Colors.grey : AppColors.secondaryColor,
                    text: continueString,
                  ),
          ),
        );
      },
    );
  }
}
