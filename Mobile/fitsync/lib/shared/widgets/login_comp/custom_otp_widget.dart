import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpWidget extends StatelessWidget {
  final bool last;
  final bool first;

  CustomOtpWidget({
    required this.first,
    required this.last,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 92,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
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
            borderSide: BorderSide(color: purple4, width: 1.5),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: gray3, width: 1.5),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
