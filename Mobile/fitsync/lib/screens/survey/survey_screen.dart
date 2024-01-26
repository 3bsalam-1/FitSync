import 'package:flutter/material.dart';

import '../../shared/colors/colors.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            //TODO here
          }, 
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple3,
          ),
        ),
      ),
    );
  }
}