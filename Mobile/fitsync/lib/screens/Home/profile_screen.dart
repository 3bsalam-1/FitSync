import 'package:fitsync/screens/Home/sleep_parameters_screen.dart';
import 'package:fitsync/screens/Home/steps_parameters_screen.dart';
import 'package:fitsync/screens/Home/water_parameters_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/profile_custom_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/profile_widget_1.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(children: [
            Text(
              "Hello Alex",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 26,
                color: black,
                // fontFamily:
              ),
            ),
          ])
        ]),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: UserWidget(),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget(
            label: "Edit Profile",
            icon: IconlyLight.edit_square,
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget(
            label: "Add Emergency Contact",
            icon: IconlyLight.calling,
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget1(
            imageUrl: "assets/images/Icons/watch.PNG",
            label: "Connect with smartwatch",
            scale: 24,
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget1(
            imageUrl: "assets/images/Icons/remianderIcon.png",
            label: "Create a Remainder ",
            scale: 24,
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget1(
            imageUrl: "assets/images/Icons/waterIcon.png",
            label: "Water Parameters",
            scale: 24,
            onTap: () {
              AnimatedNavigator().push(context, const WaterParametersScreen());
            },
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget1(
            imageUrl: "assets/images/Icons/sleepIcon.png",
            label: "Sleep Parameters",
            scale: 22,
            w: 3,
            onTap: () {
              AnimatedNavigator().push(context, const SleepParametersScreen());
            },
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget1(
            imageUrl: "assets/images/Icons/sportIcon.png",
            label: "Steps Parameters",
            scale: 20,
            w: 3,
            onTap: () {
              AnimatedNavigator().push(context, const StepsParametersScreen());
            },
          ),
          const Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
        ],
      ),
    );
  }
}
