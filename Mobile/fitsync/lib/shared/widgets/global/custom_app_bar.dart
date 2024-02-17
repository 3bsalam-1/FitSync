import 'package:flutter/material.dart';
import '../../colors/colors.dart';
import 'animated_navigator.dart';

PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: white,
    scrolledUnderElevation: 0,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: black,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        AnimatedNavigator().pop(context);
      },
      icon: const Icon(
        Icons.arrow_circle_left,
        color: purple2,
        size: 37,
      ),
    ),
    actions: [
      // todo show imageProfile here
      Padding(
        padding: const EdgeInsets.only(right: 14.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/profile.png',
            height: 48,
            width: 48,
            fit: BoxFit.fill,
          ),
        ),
      ),
    ],
  );
}
