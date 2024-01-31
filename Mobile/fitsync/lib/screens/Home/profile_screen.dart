import 'package:fitsync/shared/colors/colors.dart';
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
      ),
      body: Column(
        children: [
          Divider(
            thickness: 1,
            color: gray6,
            endIndent: 20,
            indent: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 21),
                child: Icon(
                  IconlyLight.edit_square,
                  color: purple5,
                  weight: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: black,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyLight.arrow_right_2,
                    color: purple5,
                    weight: 25,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
