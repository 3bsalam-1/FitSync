import 'package:flutter/material.dart';

class DietPlanWidget extends StatelessWidget {
  String imageUrl;
  String text;
   DietPlanWidget({
    required this.imageUrl,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (159 / 428),
          height: MediaQuery.of(context).size.height * (128 / 926),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              
            ),
          ),
        ),
        Text(text),
        
      ],
    );
    
  }
}
