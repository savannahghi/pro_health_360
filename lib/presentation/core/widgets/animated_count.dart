import 'package:flutter/material.dart';
import 'package:shared_themes/text_themes.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  const AnimatedCount(
      {required this.count,
      required Duration duration,
      Curve curve = Curves.linear,})
      : super(duration: duration, curve: curve);

  final int count;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween? _count;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _count = visitor(_count, widget.count,
        (dynamic value) => IntTween(begin: value as int),)! as IntTween;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          const TextSpan(text: 'Resend in '),
          TextSpan(
              text: _count!.evaluate(animation).toString(),
              style: TextThemes.heavySize14Text(Colors.black),),
        ],
      ),
    );
  }
}
