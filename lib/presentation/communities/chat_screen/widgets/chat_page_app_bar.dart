import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_flutter/src/extension.dart';

class ChatPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatPageAppBar({
    Key? key,
    this.showBackButton = true,
    this.showConnectionStateTile = false,
    this.onImageTap,
    this.onTitleTap,
    this.title,
    this.subtitle,
    this.onBackPressed,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  /// True if this header shows the leading back button
  final bool showBackButton;

  /// Callback to call when pressing the back button.
  /// By default it calls [Navigator.pop]
  final VoidCallback? onBackPressed;

  /// Show connection tile on header
  final bool showConnectionStateTile;

  /// The background color for this [ChannelHeader].
  final Color? backgroundColor;

  /// AppBar actions
  /// By default it shows the [ChannelAvatar]
  final List<Widget>? actions;

  /// Callback to call when the image is tapped.
  final VoidCallback? onImageTap;

  /// Callback to call when the header is tapped.
  final VoidCallback? onTitleTap;

  /// Title widget
  final Widget? title;

  /// Subtitle widget
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    final ChannelHeaderThemeData channelHeaderTheme =
        ChannelHeaderTheme.of(context);

    final Widget leadingWidget = showBackButton
        ? StreamBackButton(
            onPressed: onBackPressed,
            showUnreads: true,
          )
        : const SizedBox();

    return ConnectionStatusBuilder(
      statusBuilder: (BuildContext context, ConnectionStatus status) {
        String statusString = '';
        bool showStatus = true;

        switch (status) {
          case ConnectionStatus.connected:
            statusString = context.translations.connectedLabel;
            showStatus = false;
            break;
          case ConnectionStatus.connecting:
            statusString = context.translations.reconnectingLabel;
            break;
          case ConnectionStatus.disconnected:
            statusString = context.translations.disconnectedLabel;
            break;
        }

        final ThemeData theme = Theme.of(context);

        return InfoTile(
          showMessage: showConnectionStateTile && showStatus,
          message: statusString,
          child: AppBar(
            toolbarTextStyle: theme.textTheme.bodyText2,
            titleTextStyle: theme.textTheme.headline6,
            systemOverlayStyle: theme.brightness == Brightness.dark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
            elevation: 1,
            leading: leadingWidget,
            backgroundColor: backgroundColor ?? channelHeaderTheme.color,
            actions: actions ??
                <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: ChannelAvatar(
                        borderRadius:
                            channelHeaderTheme.avatarTheme?.borderRadius,
                        constraints:
                            channelHeaderTheme.avatarTheme?.constraints,
                        onTap: onImageTap,
                      ),
                    ),
                  ),
                ],
            centerTitle: true,
            title: InkWell(
              onTap: onTitleTap,
              child: SizedBox(
                height: preferredSize.height,
                width: preferredSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    title ??
                        ChannelName(
                          textStyle: channelHeaderTheme.titleStyle,
                        ),
                    const SizedBox(height: 2),
                    subtitle ?? const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
