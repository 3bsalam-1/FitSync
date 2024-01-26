import '../../colors/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color background;
  final void Function()? onTap;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.label,
    this.background = white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(19),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
                color: black2.withOpacity(0.2),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: black,
                  decoration: TextDecoration.none,
                ),
              ),
              Image.asset(
                imagePath,
                width: 78,
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
