import '../../shared/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/workouts_comp/custom_date_item.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workouts',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: black
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              // TODO
            }, 
            icon: const Icon(
              Icons.menu_outlined,
              color: purple2,
            ),
          ),
        ],
      ),
      body: CustomDayItem(),
    );
  }
}