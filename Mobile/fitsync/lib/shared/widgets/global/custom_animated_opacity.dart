import 'package:flutter/material.dart';

class CustomAnimatedOpacity extends StatelessWidget {
  final Duration duration;
  final Widget child;

  const CustomAnimatedOpacity({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration,
      builder: (context, value, _) => AnimatedOpacity(
        opacity: value,
        duration: duration,
        curve: Curves.easeIn,
        child: child,
      ),
    );
  }
}
