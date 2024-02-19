import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/colors/colors.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo body: ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 78,
          width: 78,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: purple5,
            elevation: 0,
            onPressed: () {},
            child: const Icon(
              Icons.home_rounded,
              color: white,
              size: 33,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: gray4.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 3,
            ),
          ],
        ),
        height: 70,
        child: BottomAppBar(
          notchMargin: 0,
          shape: const CircularNotchedRectangle(),
          surfaceTintColor: white,
          padding: const EdgeInsets.all(0),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: gray7,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.dumbbell,
                        color: gray7,
                      ),
                    ),
                    const Text('Workout'),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.bowlFood,
                        color: gray7,
                      ),
                    ),
                    const Text('Diet'),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.timeline_outlined,
                        color: gray7,
                      ),
                    ),
                    const Text('Activity'),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_outlined,
                        color: gray7,
                      ),
                    ),
                    const Text('Profile'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
