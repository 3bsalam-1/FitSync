import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/profile_custom_widget.dart';
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
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
        actions: [Padding(
          padding: const EdgeInsets.only(right:10.0),
          child: UserWidget(),
        ),],
      ),
      body: Column(
        children: [
          Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget(
            label: "Edit Profile",
            icon: IconlyLight.edit_square,
          ),
          Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget(
            label: "Add Emergency Contact",
            icon: IconlyLight.calling,
          ),
          Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Image.asset(
                    "assets/images/Icons/watch.PNG",
                    width: 26,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Connect with smartwatch",
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
          ),
          Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          ProfileWidget(
            label: "Create a Remainder",
            icon: Icons.notifications_active_outlined,
          ),
          Divider(
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


