import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/home_comp/notifications_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AnimatedNavigator().pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              color: purple3,
              size: 40,
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Notifications",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: black,

              // fontFamily:
            ),
          ),
        ),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 18, bottom: 12),
              child: Row(
                children: [
                  Text(
                    'Today',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            NotificationsWidget(
              imageUrl: "assets/images/Notifications_Images/lunch.png",
              label1: "Hey, it’s time for lunch",
              label2: "About 1 minutes ago",
              colors: [blue.withOpacity(0.2), blue1.withOpacity(0.2)],
            ),
            const Divider(
              color: gray17,
              height: 40,
              thickness: 1.3,
              endIndent: 19,
              indent: 19,
            ),
            NotificationsWidget(
                imageUrl:
                    "assets/images/Notifications_Images/lowebody-workout 1.png",
                label1: "Don’t miss your lowerbody workout",
                label2: "About 3 hours ago",
                colors: [pink.withOpacity(0.2), pink1.withOpacity(0.2)]),
            const Divider(
              color: gray17,
              height: 40,
              thickness: 1.3,
              endIndent: 19,
              indent: 19,
            ),
            NotificationsWidget(
                imageUrl: "assets/images/Notifications_Images/pancakes.png",
                label1: "Hey, let’s add some meals for your b..",
                label2: "About 3 hours ago",
                colors: [blue.withOpacity(0.2), blue1.withOpacity(0.2)]),
            const Divider(
              color: gray17,
              height: 40,
              thickness: 1.3,
              endIndent: 19,
              indent: 19,
            ),
            NotificationsWidget(
                imageUrl: "assets/images/Notifications_Images/Ab-Workout 1.png",
                label1: "Congratulations, You have finished A..",
                label2: "29 May",
                colors: [blue.withOpacity(0.2), blue1.withOpacity(0.2)]),
            const Divider(
              color: gray17,
              height: 40,
              thickness: 1.3,
              endIndent: 19,
              indent: 19,
            ),
            NotificationsWidget(
                imageUrl: "assets/images/Notifications_Images/plate2.png",
                label1: "Hey, it’s time for lunch",
                label2: "8 April",
                colors: [blue.withOpacity(0.2), blue1.withOpacity(0.2)]),
            const Divider(
              color: gray17,
              height: 40,
              thickness: 1.3,
              endIndent: 19,
              indent: 19,
            ),
            NotificationsWidget(
                imageUrl:
                    "assets/images/Notifications_Images/lowebody-workout 1.png",
                label1: "Ups, You have missed your Lowerbo...",
                label2: "3 April",
                colors: [pink.withOpacity(0.2), pink1.withOpacity(0.2)]),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 18, bottom: 27),
              child: Row(
                children: [
                  Text(
                    'A week ago',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
            NotificationsWidget(
                imageUrl: "assets/images/Notifications_Images/activity.png",
                label1: "Ups, You have missed your Lowerbo...",
                label2: "3 April",
                colors: [pink.withOpacity(0.2), pink1.withOpacity(0.2)]),
            const Divider(
              color: gray17,
              height: 40,
              thickness: 1.3,
              endIndent: 19,
              indent: 19,
            ),
            NotificationsWidget(
                imageUrl:
                    "assets/images/Notifications_Images/orange-snacks.png",
                label1: "Hey, let’s add some meals for your b..",
                label2: "About 3 hours ago",
                colors: [blue.withOpacity(0.2), blue1.withOpacity(0.2)]),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
