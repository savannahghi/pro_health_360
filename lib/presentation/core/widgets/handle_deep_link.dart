// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/deep_link_action.dart';

class HandleDeepLink extends StatefulWidget {
  const HandleDeepLink({Key? key}) : super(key: key);

  @override
  State<HandleDeepLink> createState() => _HandleDeepLinkState();
}

class _HandleDeepLinkState extends State<HandleDeepLink> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      StoreProvider.dispatch(context, DeepLinkAction());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SILPlatformLoader();
  }
}
