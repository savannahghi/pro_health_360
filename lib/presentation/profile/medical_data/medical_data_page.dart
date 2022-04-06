// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/medical_data/fetch_medical_data_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/medical_data_view_model.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data_details.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/medical_data/medical_data_item.dart';
import 'package:myafyahub/presentation/profile/medical_data/medical_data_item_title.dart';

class MedicalDataPage extends StatefulWidget {
  const MedicalDataPage({
    Key? key,
    this.graphQlClient,
  }) : super(key: key);
  final IGraphQlClient? graphQlClient;

  @override
  State<MedicalDataPage> createState() => _MedicalDataPageState();
}

class _MedicalDataPageState extends State<MedicalDataPage> {
  late IGraphQlClient client;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final List<AppContext> contexts = AppWrapperBase.of(context)!.appContexts;
    final AppSetupData appSetupData = getAppSetupData(contexts.last);
    final String graphqlEndpoint = appSetupData.clinicalEndpoint;
    final String refreshTokenEndpoint =
        appSetupData.customContext?.refreshTokenEndpoint ?? '';

    final String idToken =
        StoreProvider.state<AppState>(context)?.credentials?.idToken ?? '';
    final String userID =
        StoreProvider.state<AppState>(context)?.clientState?.user?.userId ?? '';

    if (widget.graphQlClient != null) {
      client = widget.graphQlClient!;
    } else {
      client = CustomClient(
        idToken,
        graphqlEndpoint,
        context: context,
        refreshTokenEndpoint: refreshTokenEndpoint,
        userID: userID,
      );
    }

    StoreProvider.dispatch(
      context,
      FetchMedicalDataAction(
        httpClient: client,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: medicalDataTitle),
      body: SafeArea(
        child: StoreConnector<AppState, MedicalDataViewModel>(
          converter: (Store<AppState> store) =>
              MedicalDataViewModel.fromStore(store),
          builder: (BuildContext context, MedicalDataViewModel vm) {
            if (vm.wait!.isWaitingFor(fetchMedicalDataFlag)) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const PlatformLoader(),
              );
            } else {
              if (vm.medicalData == MedicalData.initial() ||
                  vm.medicalData == null) {
                return GenericErrorWidget(
                  headerIconSvgUrl: zeroMedicalDataSvgPath,
                  actionKey: helpNoDataWidgetKey,
                  recoverCallback: () {
                    StoreProvider.dispatch(
                      context,
                      FetchMedicalDataAction(
                        httpClient: AppWrapperBase.of(context)!.graphQLClient,
                      ),
                    );
                  },
                  messageTitle: noMedicalDataString,
                  messageBody: <TextSpan>[
                    TextSpan(
                      text: noMedicalDataBodyString,
                      style: normalSize16Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                  ],
                );
              } else {
                final List<MedicalDataDetails?>? regimen =
                    vm.medicalData?.regimen;
                final List<MedicalDataDetails?>? alergies =
                    vm.medicalData?.allergies;
                final List<MedicalDataDetails?>? weight =
                    vm.medicalData?.weight;
                final List<MedicalDataDetails?>? viralLoad =
                    vm.medicalData?.viralLoad;
                final List<MedicalDataDetails?>? bmi = vm.medicalData?.bmi;
                final List<MedicalDataDetails?>? cd4Count =
                    vm.medicalData?.cd4Count;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      StoreProvider.dispatch(
                        context,
                        FetchMedicalDataAction(
                          httpClient: client,
                        ),
                      );
                    },
                    child: ListView(
                      children: <Widget>[
                        if (regimen != null && regimen.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MedicalDataItemTitle(title: regimenTitle),
                              ...List<Widget>.generate(
                                regimen.length,
                                (int index) {
                                  final String category =
                                      regimen[index]?.category?.text ?? UNKNOWN;
                                  final String medicationCodeableConcept =
                                      regimen[index]
                                              ?.medicationCodeableConcept
                                              ?.text ??
                                          UNKNOWN;
                                  return Column(
                                    children: <Widget>[
                                      MedicalDataItem(
                                        data:
                                            '$category - $medicationCodeableConcept',
                                      ),
                                      const SizedBox(height: 4),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        if (alergies != null && alergies.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MedicalDataItemTitle(title: allergiesTitle),
                              ...List<Widget>.generate(
                                alergies.length,
                                (int index) {
                                  final String valuesString =
                                      alergies[index]?.clinicalStatus?.text ??
                                          UNKNOWN;
                                  return Column(
                                    children: <Widget>[
                                      MedicalDataItem(
                                        data: valuesString,
                                        description:
                                            index == 0 ? mostRecentString : '',
                                      ),
                                      const SizedBox(height: 4),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        if (weight != null && weight.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MedicalDataItemTitle(title: weightTitle),
                              ...List<Widget>.generate(
                                weight.length,
                                (int index) {
                                  final String valuesString =
                                      weight[index]?.valueString ?? UNKNOWN;
                                  return Column(
                                    children: <Widget>[
                                      MedicalDataItem(
                                        data: '$valuesString kg',
                                        description:
                                            index == 0 ? mostRecentString : '',
                                      ),
                                      const SizedBox(height: 4),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        if (viralLoad != null && viralLoad.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MedicalDataItemTitle(title: viralLoadTitle),
                              ...List<Widget>.generate(
                                viralLoad.length,
                                (int index) {
                                  final String valuesString =
                                      viralLoad[index]?.valueString ?? UNKNOWN;
                                  return Column(
                                    children: <Widget>[
                                      MedicalDataItem(
                                        data: valuesString,
                                        description:
                                            index == 0 ? mostRecentString : '',
                                      ),
                                      const SizedBox(height: 4),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        if (bmi != null && bmi.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MedicalDataItemTitle(title: bmiTitle),
                              ...List<Widget>.generate(
                                bmi.length,
                                (int index) {
                                  final String valuesString =
                                      bmi[index]?.valueString ?? UNKNOWN;
                                  return Column(
                                    children: <Widget>[
                                      MedicalDataItem(
                                        data: valuesString,
                                        description:
                                            index == 0 ? mostRecentString : '',
                                      ),
                                      const SizedBox(height: 4),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        if (cd4Count != null && cd4Count.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MedicalDataItemTitle(title: cd4CountTitle),
                              ...List<Widget>.generate(
                                cd4Count.length,
                                (int index) {
                                  final String valuesString =
                                      cd4Count[index]?.valueString ?? UNKNOWN;
                                  return Column(
                                    children: <Widget>[
                                      MedicalDataItem(
                                        data: valuesString,
                                        description:
                                            index == 0 ? mostRecentString : '',
                                      ),
                                      const SizedBox(height: 4),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
