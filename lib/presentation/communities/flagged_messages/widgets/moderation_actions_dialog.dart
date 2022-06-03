import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/communities/ban_user_action.dart';
import 'package:myafyahub/application/redux/actions/communities/flagged_messages/delete_flagged_message_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/group_info/view_models/flagged_messages_view_model.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ModerationActionsDialog extends StatelessWidget {
  const ModerationActionsDialog({
    Key? key,
    required this.messageId,
    required this.memberId,
    required this.communityId,
    required this.communityName,
  }) : super(key: key);

  final String messageId;
  final String memberId;
  final String communityId;
  final String communityName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StoreConnector<AppState, FlaggedMessagesViewModel>(
          converter: (Store<AppState> store) {
            return FlaggedMessagesViewModel.fromStore(store);
          },
          builder: (BuildContext context, FlaggedMessagesViewModel vm) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: TextButton(
                      key: ValueKey<String>('delete_key_$messageId'),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        StoreProvider.dispatch<AppState>(
                          context,
                          DeleteFlaggedMessageAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            messageID: messageId,
                            onFailure: (String message) {
                              showTextSnackbar(
                                ScaffoldMessenger.of(context),
                                content: message,
                              );

                              Navigator.of(context).pop();
                            },
                            onSuccess: () {
                              showTextSnackbar(
                                ScaffoldMessenger.of(context),
                                content: messageDeletedText,
                              );

                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                      child: vm.wait.isWaitingFor(
                        '${deleteCommunityMessageFlag}_$messageId',
                      )
                          ? const PlatformLoader()
                          : const Text(
                              deleteMessageString,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: TextButton(
                      key: ValueKey<String>('ban_user_key_$messageId'),
                      style: TextButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColor.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColors.primaryColor.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        StoreProvider.dispatch(
                          context,
                          BanUserAction(
                            client: AppWrapperBase.of(context)!.graphQLClient,
                            memberID: memberId,
                            communityID: communityId,
                            onError: () => showTextSnackbar(
                              ScaffoldMessenger.of(context),
                              content: getErrorMessage(),
                            ),
                            onSuccess: () {
                              showTextSnackbar(
                                ScaffoldMessenger.of(context),
                                content: userBannedMessage(
                                  communityName: communityName,
                                ),
                              );

                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                      child: vm.wait.isWaitingFor('${banUserFlag}_$memberId')
                          ? const PlatformLoader()
                          : const Text(
                              banUserText,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: AppColors.primaryColor,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
