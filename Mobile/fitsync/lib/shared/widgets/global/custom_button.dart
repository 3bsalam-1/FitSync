import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final double horizontalPadding;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.horizontalPadding = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        gradient: const LinearGradient(
          colors: [
            cyan,
            purple,
            purple,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            offset: Offset(0, 2),
            color: purple2,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
