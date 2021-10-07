// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

class BeWellScaffold extends StatelessWidget {
  const BeWellScaffold({
    Key? key,
    required this.child,
    required this.gradient,
  }) : super(key: key);

  final Widget child;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(landingBackgroundImg),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

LinearGradient defaultGradient(Color primaryColor) => LinearGradient(
      colors: <Color>[
        Colors.transparent,
        primaryColor.withOpacity(0.1),
        primaryColor.withOpacity(0.8)
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
    );
