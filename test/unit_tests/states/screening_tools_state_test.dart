import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/screening_tools_state.dart';

void main() {
  group('ScreeningToolsState', () {
    test('fromJson works correctly', () {
      final Map<String, dynamic> screeningToolsStateMap = <String, dynamic>{
        'violenceState': <String, dynamic>{
          'screeningQuestions': <String, dynamic>{
            'getScreeningToolQuestions': <dynamic>[]
          },
          'errorFetchingQuestions': false,
          'timeoutFetchingQuestions': false,
        },
        'contraceptiveState': <String, dynamic>{
          'screeningQuestions': <String, dynamic>{
            'getScreeningToolQuestions': <dynamic>[]
          },
          'errorFetchingQuestions': false,
          'timeoutFetchingQuestions': false,
        },
        'tbState': <String, dynamic>{
          'screeningQuestions': <String, dynamic>{
            'getScreeningToolQuestions': <dynamic>[]
          },
          'errorFetchingQuestions': false,
          'timeoutFetchingQuestions': false,
        },
        'alcoholSubstanceUseState': <String, dynamic>{
          'screeningQuestions': <String, dynamic>{
            'getScreeningToolQuestions': <dynamic>[]
          },
          'errorFetchingQuestions': false,
          'timeoutFetchingQuestions': false,
        },
      };
      final ScreeningToolsState state =
          ScreeningToolsState.fromJson(screeningToolsStateMap);
      expect(state.violenceState!.errorFetchingQuestions, false);
      expect(state.contraceptiveState!.errorFetchingQuestions, false);
    });
  });
}
