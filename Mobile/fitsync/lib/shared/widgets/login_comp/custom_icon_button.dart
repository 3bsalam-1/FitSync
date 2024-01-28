import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class Icon_Button extends StatelessWidget {
  Widget principle_widget;
  Icon_Button({
    super.key,
    required this.principle_widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(56, 56),
          shape: CircleBorder(),
          backgroundColor: gray5,
        ),
        child: principle_widget,
        onPressed: () {},
      ),
    );
  }
}
