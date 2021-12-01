// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/actions/fetch_health_diary_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/content/health_diary_view_model.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/health_diary/pages/empty_health_diary.dart';
import 'package:myafyahub/presentation/health_diary/widgets/add_diary_entry_bottom_sheet.dart';
import 'package:myafyahub/presentation/health_diary/widgets/my_health_diary_item_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:shared_ui_components/platform_loader.dart';

class MyHealthDiaryPage extends StatefulWidget {
  @override
  State<MyHealthDiaryPage> createState() => _MyHealthDiaryPageState();
}

class _MyHealthDiaryPageState extends State<MyHealthDiaryPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchHealthDiaryAction(context: context),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: myHealthDiaryString,
        leadingWidget: SvgPicture.asset(
          backIconPath,
          color: AppColors.secondaryColor,
        ),
      ),
      body: Stack(
        children: <Widget>[
          StoreConnector<AppState, HealthDiaryViewModel>(
            converter: (Store<AppState> store) =>
                HealthDiaryViewModel.fromStore(store.state),
            builder: (BuildContext context, HealthDiaryViewModel vm) {
              if (vm.wait!.isWaitingFor(fetchHealthDiaryFlag)) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const SILPlatformLoader(),
                );
              } else if (vm.timeoutFetchingContent ?? false) {
                return const GenericTimeoutWidget(
                  route: BWRoutes.home,
                  action: 'fetching your diary',
                );
              } else if (vm.errorFetchingContent ?? false) {
                return GenericNoData(
                  key: helpNoDataWidgetKey,
                  type: GenericNoDataTypes.ErrorInData,
                  actionText: actionTextGenericNoData,
                  recoverCallback: () async {
                    StoreProvider.dispatch<AppState>(
                      context,
                      FetchHealthDiaryAction(context: context),
                    );
                  },
                  messageBody: healthDiaryErrorDetail,
                );
              } else {
                final List<HealthDiaryEntry?>? entries = vm.diaryEntries;

                if (entries != null && entries.isNotEmpty) {
                  // return entries UI here
                  return RefreshIndicator(
                    onRefresh: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchHealthDiaryAction(context: context),
                      );
                    },
                    child: ListView.builder(
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        final HealthDiaryEntry? currentEntry =
                            entries.elementAt(index);
                        if (currentEntry != null) {
                          return HealthDiaryEntryWidget(
                            diaryEntry: currentEntry,
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  );
                } else {
                  return EmptyHealthDiary(
                    refreshCallback: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        BottomNavAction(
                          currentBottomNavIndex: BottomNavIndex.home.index,
                        ),
                      );
                      Navigator.of(context).pushReplacementNamed(BWRoutes.home);
                    },
                  );
                }
              }
            },
          ),
          const DiaryAddSheet()
        ],
      ),
    );
  }
}
