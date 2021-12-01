// Flutter imports:
// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/can_record_mood_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection_component.dart';
import 'package:myafyahub/presentation/health_diary/widgets/random_quote_widget.dart';
import 'package:shared_ui_components/platform_loader.dart';

class MoodChecker extends StatefulWidget {
  const MoodChecker();

  @override
  _MoodCheckerState createState() => _MoodCheckerState();
}

class _MoodCheckerState extends State<MoodChecker> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        CanRecordMoodAction(context: context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) {
        return AppStateViewModel.fromStore(store);
      },
      builder: (BuildContext context, AppStateViewModel vm) {
        final bool canRecordMood =
            vm.appState.homeState?.canRecordMood ?? false;

        if (vm.appState.wait!.isWaitingFor(canRecordMoodFlag)) {
          return Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            child: const SILPlatformLoader(),
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
