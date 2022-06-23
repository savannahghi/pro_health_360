import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:pro_health_360/application/core/services/app_setup_data.dart';
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/health_timeline/health_timeline_offset_view_model.dart';
import 'package:pro_health_360/application/redux/view_models/health_timeline/health_timeline_view_model_factory.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/profile/health_timeline/my_health_timeline.dart';
import 'package:pro_health_360/presentation/profile/health_timeline/timeline_pagination_controls.dart';

class MyHealthTimelineContainer extends StatefulWidget {
  const MyHealthTimelineContainer({Key? key, this.graphQlClient})
      : super(key: key);

  final IGraphQlClient? graphQlClient;

  @override
  State<MyHealthTimelineContainer> createState() =>
      _MyHealthTimelineContainerState();
}

class _MyHealthTimelineContainerState extends State<MyHealthTimelineContainer> {
  IGraphQlClient getCustomClient() {
    if (widget.graphQlClient != null) {
      return widget.graphQlClient!;
    } else {
      final List<AppContext> contexts = AppWrapperBase.of(context)!.appContexts;
      final AppSetupData appSetupData = getAppSetupData(contexts.last);
      final String graphqlEndpoint = appSetupData.clinicalEndpoint;
      final String refreshTokenEndpoint =
          appSetupData.customContext?.refreshTokenEndpoint ?? '';

      final String idToken =
          StoreProvider.state<AppState>(context)?.credentials?.idToken ?? '';
      final String userID =
          StoreProvider.state<AppState>(context)?.clientState?.user?.userId ??
              '';

      return CustomClient(
        idToken,
        graphqlEndpoint,
        context: context,
        refreshTokenEndpoint: refreshTokenEndpoint,
        userID: userID,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: myHealthTimelineText),
      body: MyHealthTimeline(
        graphQlClient: getCustomClient(),
        numberOfRecords: 50,
      ),
      bottomNavigationBar:
          StoreConnector<AppState, HealthTimelineOffsetViewModel>(
        vm: () => HealthTimelineViewModelFactory(client: getCustomClient()),
        builder: (BuildContext context, HealthTimelineOffsetViewModel vm) {
          final int offset = vm.offset ?? 0;
          final int lowerBound = offset + 1;
          final int upperBound = lowerBound + 9;
          final bool hasReachedEnd = (offset + 10) > vm.count - 1;
          final bool isAtBeginning = offset == 0;

          return TimelinePaginationControls(
            lowerBound: lowerBound.toString(),
            upperBound: upperBound.toString(),
            nextPageAction: !hasReachedEnd
                ? () {
                    vm.updateOffset?.call(offset + 10);
                    vm.fetchMore?.call();
                  }
                : null,
            prevPageAction: !isAtBeginning
                ? () {
                    int currentOffset = offset;
                    int difference = 10;
                    if (currentOffset < 10) {
                      currentOffset = 0;
                      difference = 0;
                    }

                    vm.updateOffset?.call(currentOffset - difference);
                    vm.fetchMore?.call();
                  }
                : null,
          );
        },
      ),
    );
  }
}
