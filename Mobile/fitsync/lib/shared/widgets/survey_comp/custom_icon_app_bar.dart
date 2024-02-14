import 'package:flutter/material.dart';
import '../../colors/colors.dart';

PreferredSizeWidget customIconAppBar({required void Function() onPressed}) {
  return AppBar(
    backgroundColor: white,
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_circle_left,
        color: purple3,
        size: 40,
      ),
    ),
  );
}
