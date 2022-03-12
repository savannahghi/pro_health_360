import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:myafyahub/application/redux/actions/resume_with_pin_action/resume_with_pin_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/resume_with_pin/resume_pin_connector.dart';
import 'package:myafyahub/presentation/resume_with_pin/resume_pin_view_model.dart';

class ResumePinFactory extends VmFactory<AppState, ResumePinConnector> {
  final IGraphQlClient client;
  final String endpoint;

  ResumePinFactory({required this.client, required this.endpoint});

  @override
  ResumePinViewModel fromStore() {
    final String username = state.clientState?.user?.username ?? '';
    final bool isLoading = state.wait?.isWaitingFor(resumeWithPinFlag) ?? false;

    return ResumePinViewModel(
      username: username,
      isLoading: isLoading,
      onSubmit: (String value) {
        dispatch(
          ResumeWithPinAction(
            pin: value,
            httpClient: client,
            endpoint: endpoint,
          ),
        );
      },
    );
  }
}
