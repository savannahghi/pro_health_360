import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/screening_tools/update_screening_tools_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/available_screening_tools.dart';
import 'package:myafyahub/domain/core/entities/core/screening_tool.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class FetchAvailableScreeningToolsAction extends ReduxAction<AppState> {
  FetchAvailableScreeningToolsAction({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAvailableScreeningToolsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchAvailableScreeningToolsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': state.clientState!.id,
    };
    final Response response =
        await client.query(getAvailableScreeningToolQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(
          getErrorMessage('fetching available screening tools'),
        );
      }
      final List<dynamic>? availableScreeningTools =
          body['data']?['getAvailableScreeningToolQuestions'] as List<dynamic>?;
      final List<ScreeningTool> screeningToolsList = <ScreeningTool>[];

      if (availableScreeningTools?.isNotEmpty ?? false) {
        for (final dynamic tool in availableScreeningTools!) {
          final ScreeningToolsType toolType =
              screeningToolsTypeFromString(tool['toolType'] as String);

          screeningToolsList.add(
            ScreeningTool(
              title: getScreeningToolTitle(toolType),
              description: getScreeningToolDescription(toolType),
              toolType: toolType,
            ),
          );
        }

        dispatch(
          UpdateScreeningToolsState(
            availableScreeningTools: AvailableScreeningTools(
              availableScreeningTools: screeningToolsList,
            ),
          ),
        );
      } else {
        dispatch(
          UpdateScreeningToolsState(
            availableScreeningTools: AvailableScreeningTools(
              errorFetchingQuestions: true,
            ),
          ),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }

  String getScreeningToolTitle(ScreeningToolsType toolsType) {
    switch (toolsType) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return violenceTitle;

      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return contraceptiveTitle;

      case ScreeningToolsType.TB_ASSESSMENT:
        return tuberculosisTitle;

      default:
        return alcoholSubstanceUseTitle;
    }
  }

  String getScreeningToolDescription(ScreeningToolsType toolsType) {
    switch (toolsType) {
      case ScreeningToolsType.VIOLENCE_ASSESSMENT:
        return violenceDescription;

      case ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT:
        return contraceptiveDescription;

      case ScreeningToolsType.TB_ASSESSMENT:
        return tuberculosisDescription;

      default:
        return alcoholSubstanceUseTitle;
    }
  }

  ScreeningToolsType screeningToolsTypeFromString(String toolType) {
    switch (toolType) {
      case 'VIOLENCE_ASSESSMENT':
        return ScreeningToolsType.VIOLENCE_ASSESSMENT;
      case 'CONTRACEPTIVE_ASSESSMENT':
        return ScreeningToolsType.CONTRACEPTIVE_ASSESSMENT;
      case 'TB_ASSESSMENT':
        return ScreeningToolsType.TB_ASSESSMENT;
      default:
        return ScreeningToolsType.ALCOHOL_SUBSTANCE_ASSESSMENT;
    }
  }
}
