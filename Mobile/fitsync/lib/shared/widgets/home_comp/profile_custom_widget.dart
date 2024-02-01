import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfileWidget extends StatelessWidget {
  String label ;
  IconData icon ;
  
   ProfileWidget({
    required this.label, 
    required this.icon,
    
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Icon(
            icon,
            color: purple5,
            weight: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: black,
            ),
          ),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
               IconlyLight.arrow_right_2,
              color: purple5,
              weight: 25,
            ))
      ],
    );
  }
}