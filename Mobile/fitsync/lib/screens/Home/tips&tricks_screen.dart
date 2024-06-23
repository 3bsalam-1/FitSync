import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/page1.dart';
import 'package:fitsync/shared/widgets/home_comp/page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_translate_text.dart';

class TipsAndTricksScreen extends StatelessWidget {
  const TipsAndTricksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CustomAnimatedOpacity(
              child: IconButton(
                  onPressed: () {
                    AnimatedNavigator().pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    color: purple3,
                    size: 40,
                  )),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CustomAnimatedOpacity(
              child: Center(
                child: customTranslateText(
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
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CustomAnimatedOpacity(
                child: UserWidget(),
              ),
            )
          ],
          backgroundColor: white,
        ),
        body: CustomAnimatedOpacity(
          child: Column(
            children: [
              TabBar(
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 1, color: purple5),
                  insets: EdgeInsets.only(bottom: 13),
                ),
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: purple5,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                unselectedLabelColor: black,
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                padding: const EdgeInsets.only(right: 15, top: 11),
                tabs: [
                  Tab(
                    child: customTranslateText('Recent'),
                  ),
                  Tab(
                    child: customTranslateText('Recommend '),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: const TabBarView(children: [
                  Page1(),
                  Page2(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
