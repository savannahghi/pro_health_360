// Flutter imports:

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/actions/can_record_mood_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection_component.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/random_quote_widget.dart';

class MoodChecker extends StatefulWidget {
  const MoodChecker();

  @override
  _MoodCheckerState createState() => _MoodCheckerState();
}

class _MoodCheckerState extends State<MoodChecker> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch<AppState>(
        context,
        CanRecordMoodAction(context: context),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final bool canRecordMood = vm.appState.homeState?.canRecordMood ?? true;

        if (vm.appState.wait!.isWaitingFor(canRecordMoodFlag)) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: PlatformLoader(),
          );
        } else {
          return canRecordMood
              ? const MoodSelectionComponent()
              : const RandomQuoteWidget();
        }
      },
    );
  }
}
