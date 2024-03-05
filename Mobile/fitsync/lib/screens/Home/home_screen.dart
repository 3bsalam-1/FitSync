import 'package:fitsync/screens/Home/notifications_screen.dart';
import 'package:fitsync/screens/Home/profile_screen.dart';
import 'package:fitsync/screens/Home/tips&tricks_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/custom_properties_card.dart';
import 'package:fitsync/shared/widgets/home_comp/heart_graph.dart';
import 'package:fitsync/shared/widgets/home_comp/percent_indicator_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/tips_tricks_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    AnimatedNavigator()
                        .pushAndRemoveUntil(context, ProfilePage());
                  },
                  child: UserWidget()),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: gray2,
                        // fontFamily:
                      ),
                    ),
                    Text(
                      "Alex Hormozi",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: black3,
                        // fontFamily:
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                AnimatedNavigator().push(context, NotificationsScreen());
              },
              icon: Icon(
                IconlyLight.notification,
                weight: 25,
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomPropertiesCard(
                label1: "180cm",
                label2: "Height",
              ),
              CustomPropertiesCard(
                label1: "65kg",
                label2: "Weight",
              ),
              CustomPropertiesCard(
                label1: "22yo",
                label2: "Age",
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 40, bottom: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * (184 / 428),
                  height: MediaQuery.of(context).size.height * (215 / 926),
                  decoration: BoxDecoration(
                      color: purple5, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, right: 3),
                            child: Text(
                              "Calories",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Image.asset(
                              "assets/images/Icons/calories1.png",
                              color: white,
                              width: 17,
                              height: 18.4,
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: CircularPercentIndicator(
                          backgroundColor: gray21,
                          reverse: true,
                          radius:
                              MediaQuery.of(context).size.height * (75 / 926),
                          lineWidth: 13.0,
                          percent: (730 / 1000),
                          progressColor: white,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "730",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 26,
                                  color: white,
                                ),
                              ),
                              Text(
                                "kCal",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 40),
                    child: PercentIndicatorWidget(
                        color: orange, label1: 40, label2: "Diet"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 15),
                    child: PercentIndicatorWidget(
                        color: green1, label1: 59, label2: "Workout"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 15),
                    child: PercentIndicatorWidget(
                        color: yellow1, label1: 34, label2: "Focus"),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * (184 / 428),
                  height: MediaQuery.of(context).size.height * (170 / 926),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(19),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                          color: black2.withOpacity(0.15),
                        ),
                      ]),
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 12),
                          child: Text(
                            "Steps",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: black2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        backgroundColor: gray22,
                        reverse: true,
                        radius: MediaQuery.of(context).size.width * (57 / 428),
                        lineWidth: 6.0,
                        percent: (18249 / 30000),
                        progressColor: purple5,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Icons/sneakers.png",
                              width: 20,
                              height: 14,
                              color: purple5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "18,249",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: ink,
                              ),
                            ),
                            Text(
                              "Steps",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: ink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * (184 / 428),
                    height: MediaQuery.of(context).size.height * (170 / 926),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(19),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                            color: black2.withOpacity(0.15),
                          ),
                        ]),
                    child: Stack(children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24.53, top: 12),
                                child: Text(
                                  "Sleep",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: black2,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.53, top: 4),
                                  child: RichText(
                                    text: TextSpan(
                                      text: "8",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: gray3,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "h",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: gray3)),
                                        TextSpan(
                                            text: " 20",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: gray3)),
                                        TextSpan(
                                            text: "m",
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                                color: gray3)),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        left: 24,
                        child: Image.asset(
                          "assets/images/Sleep-Graph.png",
                          height: 70,
                          width:
                              MediaQuery.of(context).size.width * (130 / 428),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * (184 / 428),
                  height: MediaQuery.of(context).size.height * (170 / 926),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(19),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                          color: black2.withOpacity(0.15),
                        ),
                      ]),
                  child: Stack(children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.53, top: 12),
                              child: Text(
                                "Heart",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: black2,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.53, top: 4),
                              child: Text(
                                "78 BPM",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: gray3,
                                ),
                              ),
                            ),
                            HeartGraph(),



                            
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * (184 / 428),
                    height: MediaQuery.of(context).size.height * (170 / 926),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(19),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                            color: black2.withOpacity(0.15),
                          ),
                        ]),
                    child: Stack(children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24.53, top: 12),
                                child: Text(
                                  "Water",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: black2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24.53, top: 4),
                                child: Text(
                                  "0.25 L",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: gray3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 30,
                        left: 24.5,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  "assets/images/glass.png",
                                  height: 34,
                                  width: MediaQuery.of(context).size.width *
                                      (33 / 428),
                                ),
                                Positioned(
                                  top: 3,
                                  child: Icon(
                                    Icons.add,
                                    color: blue2,
                                    size: MediaQuery.of(context).size.width *
                                        (33 / 428),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  (15 / 428),
                            ),
                            Image.asset(
                              "assets/images/glass.png",
                              height: 34,
                              width: MediaQuery.of(context).size.width *
                                  (33 / 428),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  (15 / 428),
                            ),
                            Image.asset(
                              "assets/images/glass.png",
                              height: 34,
                              width: MediaQuery.of(context).size.width *
                                  (33 / 428),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                Text(
                  "Tips & Tricks",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: black3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              AnimatedNavigator().push(context, TipsAndTricksScreen());
            },
            child: TipsAndTricksWidget(
              imageUrl: "assets/images/walking.jfif",
              label1: "Sport",
              label2: "How Fit Can You Get From Just\n",
              label3: "Walking?",
              label4:
                  "walking is good for you, obviously, But can\nit whip you into shape ",
              label5: "5 Min read",
            ),
          ),
          SizedBox(
            height: 45,
          ),
        ]),
      ),
    );
  }
}
