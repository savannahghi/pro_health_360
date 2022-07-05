import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/src/i_flutter_graphql_client.dart';
import 'package:intl/intl.dart';
import 'package:pro_health_360/application/redux/actions/health_timeline/fetch_health_timeline_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/health_timeline/health_timeline_items_view_model.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/codeable_concept.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/fhir_enums.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/fhir_resource.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/reaction.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/reference.dart';
import 'package:pro_health_360/domain/core/entities/profile/timeline_item.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/profile/health_timeline/timeline_indicator.dart';
import 'package:pro_health_360/presentation/profile/widgets/custom_timeline_list_item.dart';

class MyHealthTimeline extends StatefulWidget {
  const MyHealthTimeline({
    Key? key,
    required this.graphQlClient,
    this.numberOfRecords = 10,
    this.showMore = false,
    this.showMoreCallback,
  }) : super(key: key);

  final IGraphQlClient graphQlClient;
  final int numberOfRecords;
  final bool showMore;
  final VoidCallback? showMoreCallback;

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

    StoreProvider.dispatch(
      context,
      FetchHealthTimelineAction(
        httpClient: widget.graphQlClient,
        limit: widget.numberOfRecords,
      ),
    );
  }

  // TODO: return once problem figured out
  // void calculateHeights(List<String> dates) {
  //   for (final String date in dates) {
  //     final GlobalObjectKey<State<StatefulWidget>> widgetKey =
  //         keys[date]! as GlobalObjectKey<State<StatefulWidget>>;

  //     final BuildContext? keyContext = widgetKey.currentContext;

  //     if (keyContext != null) {
  //       final RenderBox? box = keyContext.findRenderObject() as RenderBox?;
  //       heights[date] = box?.size.height ?? 1.0;
  //     }
  //   }

  //   setState(() {
  //     hasDoneCalculation = true;
  //   });
  // }

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

          if (categoryCode == ObservationCategoryCodes.vital_signs.name) {
            leadingIcon = lifelineIcon;
          } else if (categoryCode == ObservationCategoryCodes.laboratory.name) {
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
          title = code?.text;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              myHealthTimelineText,
              style: boldSize14Text(AppColors.greyTextColor),
            ),
            const SizedBox(height: 20),
            StoreConnector<AppState, HealthTimelineItemsViewModel>(
              converter: (Store<AppState> store) =>
                  HealthTimelineItemsViewModel.fromStore(store),
              builder: (BuildContext context, HealthTimelineItemsViewModel vm) {
                if (vm.wait.isWaitingFor(fetchHealthTimelineFlag)) {
                  return const PlatformLoader();
                } else if (vm.healthTimelineItems != null &&
                    vm.healthTimelineItems!.isNotEmpty) {
                  final List<String> items =
                      vm.healthTimelineItems!.keys.toList();

                  // TODO: return once problem figured out
                  // if (!hasDoneCalculation) {
                  //   processHeights(items);
                  // }

                  return ListView.builder(
                    key: const Key('list_key'),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final String key = items[index];
                      final DateTime date = DateFormat('yy-MM-dd').parse(key);

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
                          // TODO: return once problem figured out
                          // if (hasDoneCalculation) ...<Widget>[
                          //   CustomPaint(
                          //     size: Size(1, height),
                          //     painter: DashedLine(
                          //       dashOffset: index == 0 ? 30 : 0,
                          //       dotOffset: 30,
                          //       dashSize: 5,
                          //       gapSize: 2,
                          //       color: AppColors.timelineDotColor,
                          //     ),
                          //   ),
                          //   const SizedBox(width: 12),
                          // ],
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
              },
            ),
            if (widget.showMore && widget.numberOfRecords >= 10)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: const Key('view_more_key'),
                    onPressed: () => widget.showMoreCallback?.call(),
                    text: viewMoreText,
                    buttonColor: AppColors.primaryColor.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // TODO: return once problem figured out
  // void processHeights(List<String> dates) {
  //   for (final String date in dates) {
  //     final GlobalObjectKey<State<StatefulWidget>> widgetKey =
  //         GlobalObjectKey(date);

  //     keys[date] = widgetKey;
  //   }

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     calculateHeights(dates);
  //   });
  // }
}
