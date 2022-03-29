import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/profile/health_timeline/timeline_indicator.dart';
import 'package:myafyahub/presentation/profile/widgets/custom_timeline_list_item.dart';
import 'package:myafyahub/presentation/profile/widgets/dashed_line.dart';

class MyHealthTimeline extends StatefulWidget {
  const MyHealthTimeline({Key? key}) : super(key: key);

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

    StoreProvider.dispatch(context, FetchHealthTimelineAction());
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

                    double height = heights[key] ?? 1;

                    if (hasDoneCalculation && index == 0) {
                      height = heights[key]! * 0.8;
                    }

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
                        if (hasDoneCalculation)
                          Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? height * 0.3 : 0.0,
                              right: 12.0,
                            ),
                            child: CustomPaint(
                              size: Size(1, height),
                              painter: DashedLine(
                                dotOffset: index != 0 ? 44.0 : 0.0,
                                dashSize: 5,
                                gapSize: 2,
                                color: AppColors.timelineDotColor,
                              ),
                            ),
                          ),
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
                return const GenericEmptyData(
                  item: 'health timeline items',
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
      String? time = '';

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
          title = code?.text;
          time = date;
        },
        medication: (
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
          title = capitalizeFirst(describeEnum(type!));
          time = recordedDate;
        },
      );

      final TimelineItem timelineItem = TimelineItem(
        leadingIcon: syringeIcon,
        title: title ?? UNKNOWN,
        time: time,
      );

      results.add(CustomTimelineListItem(item: timelineItem));
      results.add(const SizedBox(height: 10));
    }

    return results;
  }
}
