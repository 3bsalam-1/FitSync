import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Icon_Button extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Widget principle_widget;
  //final websiteUri;
  final void Function()? onPressed;
  const Icon_Button({
    super.key,
    // ignore: non_constant_identifier_names
    required this.principle_widget,
    //this.websiteUri,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(56, 56),
          shape: const CircleBorder(),
          backgroundColor: gray5,
        ),
        onPressed: onPressed,
        child: principle_widget,
      ),
    );
  }
}

