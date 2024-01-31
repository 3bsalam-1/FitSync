import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../colors/colors.dart';

class CustomToggleSwitch extends StatelessWidget {
  final void Function()? onTapkg;
  final void Function()? onTapBs;
  final bool isSelected;
  final String text1;
  final String text2;

  const CustomToggleSwitch({
    super.key,
    required this.onTapkg,
    required this.isSelected,
    required this.onTapBs,
    this.text1 = 'kg',
    this.text2 = '1bs',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: purple2,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTapkg,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 33,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isSelected ?  purple2: white,
              ),
              child: Text(
                text1,
                style: TextStyle(
                  color: isSelected ? white: gray4,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onTapBs,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 33,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isSelected ? white: purple2,
              ),
              child: Text(
                text2,
                style: TextStyle(
                  color: isSelected ? gray4: white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
