import 'package:flutter/material.dart';
import '../../colors/colors.dart';
import 'animated_navigator.dart';

class CustomMenuButton extends StatelessWidget {
  final List<String> labels;
  final List<Widget> screens;
  final Widget? child;

  const CustomMenuButton({
    super.key,
    required this.labels,
    required this.screens,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: PopupMenuButton<int>(
        iconColor: purple2,
        color: white,
        surfaceTintColor: white,
        onSelected: (value) {
          AnimatedNavigator().push(
            context,
            screens[value],
          );
        },
        itemBuilder: (context) => List.generate(
          labels.length,
          (index) => PopupMenuItem(
            value: index,
            child: Text(
              labels[index],
              style: const TextStyle(
                color: purple5,
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
