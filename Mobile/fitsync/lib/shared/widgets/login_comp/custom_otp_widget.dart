import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpWidget extends StatefulWidget {
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
  State<CustomOtpWidget> createState() => _CustomOtpWidgetState();
}

class _CustomOtpWidgetState extends State<CustomOtpWidget> {
  Color colorBorder = gray9;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: TextFormField(
          controller: widget.controller,
          onChanged: (value) {
            if (value.length == 1 && widget.last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && widget.first == false) {
              FocusScope.of(context).previousFocus();
            }
            if (value.length == 1) {
              setState(() {
                colorBorder = purple4;
              });
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
            filled: true,
            fillColor: white,
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: purple4, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorder, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
