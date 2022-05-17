// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/notifications/fetch_notifications_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/notifications/notifications_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/notifications/notification_list_item.dart'
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
                : RefreshIndicator(
                    onRefresh: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchNotificationsAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      );
                    },
                    child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        final NotificationDetails? currentNotificationDetails =
                            notifications.elementAt(index);

                        return consumer.NotificationListItem(
                          notificationDetails: currentNotificationDetails,
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
