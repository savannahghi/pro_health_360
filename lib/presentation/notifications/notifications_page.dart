// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:pro_health_360/application/redux/actions/notifications/fetch_notification_filters_action.dart';
import 'package:pro_health_360/application/redux/actions/notifications/fetch_notifications_action.dart';
import 'package:pro_health_360/application/redux/actions/update_selected_notification_filter.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/notifications/notifications_view_model.dart';
import 'package:afya_moja_core/src/domain/core/entities/notifications/notification_filter.dart';

// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:pro_health_360/presentation/health_diary/widgets/mood_selection/mood_symptom_widget.dart';
import 'package:pro_health_360/presentation/notifications/notification_list_item.dart'
    as consumer;

// Package imports:

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({required this.bottomNavIndex});

  final int bottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavIndex: bottomNavIndex,
      appBar: CustomAppBar(
        title: notificationsText,
        trailingWidget: const SizedBox(),
        bottomNavIndex: bottomNavIndex,
      ),
      body: StoreConnector<AppState, NotificationsViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            FetchNotificationsAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
          store.dispatch(
            FetchNotificationFiltersAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) =>
            NotificationsViewModel.fromStore(store),
        builder: (BuildContext context, NotificationsViewModel vm) {
          if (vm.wait.isWaitingFor(fetchNotificationsFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          }
          final List<NotificationDetails?> notifications = vm.notifications;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: notifications.isEmpty
                ? GenericErrorWidget(
                    actionKey: helpNoDataWidgetKey,
                    recoverCallback: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchNotificationsAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      );
                    },
                    headerIconSvgUrl: noNotificationsImageSvgPath,
                    messageTitle: noNotificationsTitle,
                    messageBody: <TextSpan>[
                      TextSpan(
                        text: noNotificationsDescription,
                        style: normalSize16Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 50,
                          child: ListView.builder(
                            key: notificationFiltersKey,
                            scrollDirection: Axis.horizontal,
                            itemCount: vm.notificationFilterState
                                ?.notificationFilters?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final List<NotificationFilter?>? filterList = vm
                                  .notificationFilterState?.notificationFilters;

                              final bool isSelected = filterList?[index] ==
                                  vm.notificationFilterState?.selectedFilter;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 12,
                                ),
                                child: CustomChipWidget(
                                  title: filterList?[index]?.name ?? '',
                                  gestureKey: Key(index.toString()),
                                  isSelected: isSelected,
                                  onTap: () {
                                    StoreProvider.dispatch(
                                      context,
                                      UpdateSelectedNotificationFilterAction(
                                        selectedFilter: filterList?[index],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        RefreshIndicator(
                          onRefresh: () async {
                            StoreProvider.dispatch<AppState>(
                              context,
                              FetchNotificationsAction(
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                              ),
                            );
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              final NotificationDetails?
                                  currentNotificationDetails =
                                  notifications.elementAt(index);

                              return consumer.NotificationListItem(
                                notificationDetails: currentNotificationDetails,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
