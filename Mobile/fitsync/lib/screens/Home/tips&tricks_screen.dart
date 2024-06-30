import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/page1.dart';
import 'package:fitsync/shared/widgets/home_comp/page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsAndTricksScreen extends StatelessWidget {
  TipsAndTricksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: IconButton(
                onPressed: () {
                  AnimatedNavigator().pop(context);
                },
                icon: Icon(
                  Icons.arrow_circle_left,
                  color: purple3,
                  size: 40,
                )),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Center(
              child: Text(
                "Tips & Tricks",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: black,

                  // fontFamily:
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: UserWidget(),
            )
          ],
          backgroundColor: white,
        ),
        body: Column(
          children: [
            Container(
              child: TabBar(
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 1, color: purple5),
                      insets: EdgeInsets.only(bottom: 13)),
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: purple5,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  unselectedLabelColor: black,
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  padding: EdgeInsets.only(right: 15, top: 11),
                  tabs: [
                    Tab(child: Text('Recent')),
                    Tab(child: Text('Recommend ')),
                  ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: TabBarView(children: [
                Page1(),
                Page2(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
