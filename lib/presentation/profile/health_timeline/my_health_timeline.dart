import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/src/i_flutter_graphql_client.dart';
import 'package:intl/intl.dart';
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/health_timeline/fetch_health_timeline_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/health_timeline/health_timeline_view_model.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/codeable_concept.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_enums.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/reaction.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/reference.dart';
import 'package:myafyahub/domain/core/entities/profile/timeline_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/profile/health_timeline/timeline_indicator.dart';
import 'package:myafyahub/presentation/profile/widgets/custom_timeline_list_item.dart';
import 'package:myafyahub/presentation/profile/widgets/dashed_line.dart';

class MyHealthTimeline extends StatefulWidget {
  const MyHealthTimeline({Key? key, this.graphQlClient}) : super(key: key);

  final IGraphQlClient? graphQlClient;

  @override
  State<MyHealthTimeline> createState() => _MyHealthTimelineState();
}

class _MyHealthTimelineState extends State<MyHealthTimeline> {
  Map<String, Key> keys = <String, Key>{};

  Map<String, double> heights = <String, double>{};

  bool hasDoneCalculation = false;

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

    late IGraphQlClient client;

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
      FetchHealthTimelineAction(httpClient: client),
    );
  }

  void calculateHeights(List<String> dates) {
    for (final String date in dates) {
      final GlobalObjectKey<State<StatefulWidget>> widgetKey =
          keys[date]! as GlobalObjectKey<State<StatefulWidget>>;

      final BuildContext? keyContext = widgetKey.currentContext;

      if (keyContext != null) {
        final RenderBox? box = keyContext.findRenderObject() as RenderBox?;
        heights[date] = box?.size.height ?? 1.0;
      }
    }

    setState(() {
      hasDoneCalculation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          myHealthTimelineText,
          style: boldSize14Text(AppColors.greyTextColor),
        ),
        const SizedBox(height: 20),
        StoreConnector<AppState, HealthTimelineViewModel>(
          converter: (Store<AppState> store) {
            return HealthTimelineViewModel.fromStore(store);
          },
          builder: (BuildContext context, HealthTimelineViewModel vm) {
            if (vm.wait.isWaitingFor(fetchHealthTimelineFlag)) {
              return const PlatformLoader();
            } else {
              if (vm.healthTimelineItems != null &&
                  vm.healthTimelineItems!.isNotEmpty) {
                for (final String date
                    in vm.healthTimelineItems!.keys.toList()) {
                  final GlobalObjectKey<State<StatefulWidget>> widgetKey =
                      GlobalObjectKey(date);

                  keys[date] = widgetKey;
                }

                if (!hasDoneCalculation) {
                  WidgetsBinding.instance?.addPostFrameCallback((_) {
                    calculateHeights(vm.healthTimelineItems!.keys.toList());
                  });
                }

                final List<String> items =
                    vm.healthTimelineItems!.keys.toList();

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final String key = items[index];

                    final DateTime date = DateFormat('yy-MM-dd').parse(key);

                    final double height = heights[key] ?? 1;

                    final List<FhirResource> fhirResources =
                        vm.healthTimelineItems![key]!;

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      key: keys[key],
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 24),
                              TimelineIndicator(date: date),
                            ],
                          ),
                        ),
                        if (hasDoneCalculation) ...<Widget>[
                          CustomPaint(
                            size: Size(1, height),
                            painter: DashedLine(
                              dashOffset: index == 0 ? 30 : 0,
                              dotOffset: 30,
                              dashSize: 5,
                              gapSize: 2,
                              color: AppColors.timelineDotColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        Flexible(
                          flex: 8,
                          child: Column(
                            children: getItemCards(fhirResources),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: items.length,
                );
              } else {
                return const GenericErrorWidget(
                  actionKey: helpNoDataWidgetKey,
                  headerIconSvgUrl: healthTimelineNotAvailableImage,
                  messageTitle: healthTimelineAwaitsText,
                  messageBody: <TextSpan>[
                    TextSpan(text: healthTimelineAwaitsDescription)
                  ],
                  recoverCallback: null,
                  showPrimaryButton: false,
                );
              }
            }
          },
        ),
      ],
    );
  }

  List<Widget> getItemCards(List<FhirResource> resource) {
    final List<Widget> results = <Widget>[];

    for (final FhirResource resource in resource) {
      String? title = UNKNOWN;
      String? subtitle;
      String? time;
      String leadingIcon = syringeIcon;

      resource.when(
        observation: (
          List<CodeableConcept>? category,
          CodeableConcept? code,
          String? date,
          ReferenceType? resourceType,
          ObservationStatus? status,
          Reference? patient,
          String? timelineDate,
          String? value,
        ) {
          final String? categoryCode = category?.first.coding?.first?.code;

          if (categoryCode == 'vital-signs') {
            leadingIcon = lifelineIcon;
          } else if (categoryCode == 'laboratory') {
            leadingIcon = flaskIcon;
          }

          title = code?.coding?.first?.display;

          final DateTime? parsedDate =
              DateTime.tryParse(value ?? '')?.toLocal();

          if (parsedDate != null) {
            subtitle = DateFormat('d MMM y').format(parsedDate);
          } else {
            subtitle = value;
          }

          if (date != null) time = date;
        },
        allergyIntolerance: (
          List<AllergyIntoleranceCategory>? category,
          CodeableConcept? clinicalStatus,
          CodeableConcept? code,
          Reference? patient,
          List<Reaction>? reaction,
          String? recordedDate,
          ReferenceType? resourceType,
          String? timelineDate,
          AllergyIntoleranceType? type,
          CodeableConcept? verificationStatus,
        ) {
          title = clinicalStatus?.text;
          final String? reactionText =
              reaction?.first.manifestation?.first?.text?.toLowerCase();
          final String reactionSeverity = describeEnum(
            reaction?.first.severity ?? AllergyIntoleranceSeverity.mild,
          );

          if (reactionText != null) {
            subtitle = getReactionText(reactionSeverity, reactionText);
          }

          leadingIcon = allergiesIcon;

          if (recordedDate != null) time = recordedDate;
        },
        medicationStatement: (
          CodeableConcept? category,
          CodeableConcept? code,
          String? date,
          CodeableConcept? medication,
          ReferenceType? resourceType,
          MedicationStatusCodes? status,
          Reference? subject,
          String? timelineDate,
        ) {
          title = medication?.text;

          leadingIcon = capsuleIcon;

          if (date != null) time = date;
        },
      );

      final TimelineItem timelineItem = TimelineItem(
        leadingIcon: leadingIcon,
        title: title ?? UNKNOWN,
        subtitle: subtitle,
        time: time,
      );

      results.add(CustomTimelineListItem(item: timelineItem));
      results.add(const SizedBox(height: 10));
    }

    return results;
  }
}
