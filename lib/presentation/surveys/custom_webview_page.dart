import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/surveys/verify_survey_submission_action.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/surveys/widgets/custom_webview_back_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  const CustomWebView({
    required this.url,
    required this.appBarTitle,
  });

  final String appBarTitle;
  final String url;

  @override
  State<CustomWebView> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.appBarTitle,
        showBackButton: false,
        leadingWidget: const CustomWebviewBackButton(),
      ),
      body: WillPopScope(
        onWillPop: () async {
          StoreProvider.dispatch(
            context,
            VerifySurveySubmissionAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
          return true;
        },
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
