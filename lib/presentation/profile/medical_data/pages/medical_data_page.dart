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
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/medical_data/widgets/medical_data_widget.dart';

class MedicalDataPage extends StatefulWidget {
  const MedicalDataPage({Key? key, this.graphQlClient}) : super(key: key);

  final IGraphQlClient? graphQlClient;

  @override
  State<MedicalDataPage> createState() => _MedicalDataPageState();
}

class _MedicalDataPageState extends State<MedicalDataPage> {
  late IGraphQlClient client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: medicalDataTitle),
      body: SafeArea(
        child: StoreConnector<AppState, MedicalDataViewModel>(
          onInit: (Store<AppState> store) {
            final List<AppContext> contexts =
                AppWrapperBase.of(context)!.appContexts;
            final AppSetupData appSetupData = getAppSetupData(contexts.last);
            final String graphqlEndpoint = appSetupData.clinicalEndpoint;
            final String refreshTokenEndpoint =
                appSetupData.customContext?.refreshTokenEndpoint ?? '';

            final String idToken = store.state.credentials?.idToken ?? '';
            final String userID = store.state.clientState?.user?.userId ?? '';

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

            store.dispatch(
              FetchMedicalDataAction(httpClient: client),
            );
          },
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
              final MedicalData medicalData =
                  vm.medicalData ?? MedicalData.initial();

              final List<MedicalDataDetails?> regimen =
                  vm.medicalData?.regimen ?? <MedicalDataDetails>[];
              final List<MedicalDataDetails?> allergies =
                  vm.medicalData?.allergies ?? <MedicalDataDetails>[];
              final List<MedicalDataDetails?> weight =
                  vm.medicalData?.weight ?? <MedicalDataDetails>[];
              final List<MedicalDataDetails?> viralLoad =
                  vm.medicalData?.viralLoad ?? <MedicalDataDetails>[];
              final List<MedicalDataDetails?> bmi =
                  vm.medicalData?.bmi ?? <MedicalDataDetails>[];
              final List<MedicalDataDetails?> cd4Count =
                  vm.medicalData?.cd4Count ?? <MedicalDataDetails>[];

              if ((regimen.isEmpty &&
                      allergies.isEmpty &&
                      weight.isEmpty &&
                      viralLoad.isEmpty &&
                      bmi.isEmpty &&
                      cd4Count.isEmpty) ||
                  (medicalData == MedicalData.initial())) {
                return GenericErrorWidget(
                  headerIconSvgUrl: zeroMedicalDataSvgPath,
                  actionKey: helpNoDataWidgetKey,
                  recoverCallback: () {
                    StoreProvider.dispatch(
                      context,
                      FetchMedicalDataAction(
                        httpClient: client,
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
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      StoreProvider.dispatch(
                        context,
                        FetchMedicalDataAction(httpClient: client),
                      );
                    },
                    child: ListView(
                      children: <Widget>[
                        if (regimen.isNotEmpty)
                          MedicalDataWidget(
                            medicalDataType: MedicalDataType.REGIMEN,
                            medicalDataDetails: regimen,
                          ),
                        if (allergies.isNotEmpty)
                          MedicalDataWidget(
                            medicalDataType: MedicalDataType.ALLERGIES,
                            medicalDataDetails: allergies,
                          ),
                        if (weight.isNotEmpty)
                          MedicalDataWidget(
                            medicalDataType: MedicalDataType.WEIGHT,
                            medicalDataDetails: weight,
                          ),
                        if (viralLoad.isNotEmpty)
                          MedicalDataWidget(
                            medicalDataType: MedicalDataType.VIRAL_LOAD,
                            medicalDataDetails: viralLoad,
                          ),
                        if (bmi.isNotEmpty)
                          MedicalDataWidget(
                            medicalDataType: MedicalDataType.BMI,
                            medicalDataDetails: bmi,
                          ),
                        if (cd4Count.isNotEmpty)
                          MedicalDataWidget(
                            medicalDataType: MedicalDataType.CD4COUNT,
                            medicalDataDetails: cd4Count,
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
