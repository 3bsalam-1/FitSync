import 'package:flutter/material.dart';

class CustomBluetoothError extends StatelessWidget {
  final String imagePath;
  final String errorText;

  const CustomBluetoothError({
    super.key,
    required this.errorText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const Spacer(flex: 3),
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          const Spacer(flex: 1),
          Text(
            errorText,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ), 
          const Spacer(flex: 2),         
        ],
      ),
    );
  }
}
