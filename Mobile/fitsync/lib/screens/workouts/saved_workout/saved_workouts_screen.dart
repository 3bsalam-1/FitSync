import 'package:flutter/material.dart';
import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/global/animated_navigator.dart';

class SavedWorkOutsScreen extends StatelessWidget {
  const SavedWorkOutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text('Saved Workout'),
        titleTextStyle: const TextStyle(
          color: black,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple3,
            size: 40,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 7,
              right: 12,
            ),
            child: CircleAvatar(
              radius: 20,
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: 8,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.only(
                  left: 22,
                  top: 12,
                  bottom: 12,
                  right: 12,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: gray9,
                  ),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: gray9.withOpacity(0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Body',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: black,
                          ),
                        ),
                        Text(
                          '20 Exercises',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: gray4,
                          ),
                        ),
                        Text(
                          '60 Minutes',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: gray4,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/pullup.png',
                      width: 130,
                      height: 108,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
