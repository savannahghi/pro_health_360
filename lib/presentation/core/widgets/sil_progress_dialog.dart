// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

const BoxDecoration _DefaultDecoration = BoxDecoration(
  color: AppColors.whiteColor,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

class SILProgressDialog extends StatelessWidget {
  /// Dialog will be closed when [future] task is finished.

  /// [BoxDecoration] of [FutureProgressDialog].
  final BoxDecoration? decoration;

  /// opacity of [FutureProgressDialog]
  final double opacity;

  /// If you want to use custom progress widget set [progress].
  final Widget? progress;

  /// If you want to use message widget set [message].
  final Widget? message;

  const SILProgressDialog({
    this.decoration,
    this.opacity = 1.0,
    this.progress,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPopCallback,
      child: _buildDialog(context),
    );
  }

  Widget _buildDialog(BuildContext context) {
    Widget content;
    if (message == null) {
      content = Center(
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          decoration: decoration ?? _DefaultDecoration,
          child: progress ?? const CircularProgressIndicator(),
        ),
      );
    } else {
      content = Container(
        height: 100,
        padding: const EdgeInsets.all(20),
        decoration: decoration ?? _DefaultDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            progress ?? const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Expanded(
              child: message!,
            ),
          ],
        ),
      );
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Opacity(
        opacity: opacity,
        child: content,
      ),
    );
  }
}

void hideProgressDialog(BuildContext context) {
  Navigator.pop(context);
}
