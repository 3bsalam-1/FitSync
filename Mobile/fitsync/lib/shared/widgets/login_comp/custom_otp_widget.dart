import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpWidget extends StatelessWidget {
  final bool last;
  final bool first;
  final TextEditingController? controller;

  const CustomOtpWidget({
    required this.first,
    required this.last,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 92,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: purple4, width: 1.5),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: gray3, width: 1.5),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
