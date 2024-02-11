import 'package:flutter/material.dart';
import '../../colors/colors.dart';

void customSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 700),
      backgroundColor: red,
      content: Text(
        errorMessage,
      ),
    ),
  );
}
