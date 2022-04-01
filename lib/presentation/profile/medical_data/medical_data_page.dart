// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
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
  const MedicalDataPage({Key? key}) : super(key: key);

  @override
  State<MedicalDataPage> createState() => _MedicalDataPageState();
}

class _MedicalDataPageState extends State<MedicalDataPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    StoreProvider.dispatch(
      context,
      FetchMedicalDataAction(
        httpClient: AppWrapperBase.of(context)!.graphQLClient,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: medicalDataPageTitle),
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
                final MedicalDataDetails? regimen = vm.medicalData?.regimen;
                final MedicalDataDetails? alergies = vm.medicalData?.allergies;
                final List<MedicalDataDetails?>? weight =
                    vm.medicalData?.weight;
                final List<MedicalDataDetails?>? viralLoad =
                    vm.medicalData?.viralLoad;
                final List<MedicalDataDetails?>? bmi = vm.medicalData?.bmi;
                final List<MedicalDataDetails?>? cd4Count =
                    vm.medicalData?.cd4Count;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: <Widget>[
                      if (regimen != null &&
                          regimen != MedicalDataDetails.initial())
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MedicalDataItemTitle(title: regimenTitle),
                            MedicalDataItem(
                              data: regimen.category?.text ?? UNKNOWN,
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      if (alergies != null &&
                          alergies != MedicalDataDetails.initial())
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MedicalDataItemTitle(title: allergiesTitle),
                            MedicalDataItem(
                              data: alergies.valueString ?? UNKNOWN,
                              description: mostRecentString,
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
                                      data: valuesString,
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
                );
              }
            }
          },
        ),
      ),
    );
  }
}
