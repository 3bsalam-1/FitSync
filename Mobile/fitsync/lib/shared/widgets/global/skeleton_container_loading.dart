import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class SkeletonContainerLoading extends StatefulWidget {
  final BoxShape shape;
  final double height;
  final double width;

  const SkeletonContainerLoading({
    super.key,
    this.shape = BoxShape.rectangle,
    required this.height,
    required this.width,
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
        shape: widget.shape,
        borderRadius: BorderRadius.circular(10),
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
