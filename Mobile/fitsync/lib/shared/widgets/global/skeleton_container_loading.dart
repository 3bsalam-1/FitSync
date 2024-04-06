import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class SkeletonContainerLoading extends StatefulWidget {
  final double height;
  final double width;
  final double borderRaduis;

  const SkeletonContainerLoading({
    super.key,
    required this.height,
    required this.width,
    this.borderRaduis = 10,
  });

  @override
  State<SkeletonContainerLoading> createState() =>
      _SkeletonContainerLoadingState();
}

class _SkeletonContainerLoadingState extends State<SkeletonContainerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> animation;
  late Animation<Color?> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    animation = ColorTween(
      begin: gray2.withOpacity(0.3),
      end: gray2.withOpacity(0.4),
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    animation2 = ColorTween(
      end: gray2.withOpacity(0.4),
      begin: gray2.withOpacity(0.2),
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRaduis),
        gradient: LinearGradient(
          colors: [
            animation.value ?? Colors.transparent,
            animation2.value ?? Colors.transparent,
            animation.value ?? Colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(),
    );
  }
}
