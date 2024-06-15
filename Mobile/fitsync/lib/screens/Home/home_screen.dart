import 'package:fitsync/screens/Home/notifications_screen.dart';
import 'package:fitsync/screens/Home/profile_screen.dart';
import 'package:fitsync/screens/Home/tips&tricks_screen.dart';
import 'package:fitsync/services/pref.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/custom_properties_card.dart';
import 'package:fitsync/shared/widgets/home_comp/heart_graph.dart';
import 'package:fitsync/shared/widgets/home_comp/tips_tricks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../data/cubit/user_data/user_data_info_cubit.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/home_comp/custom_circle_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: white,
            title: CustomAnimatedOpacity(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      AnimatedNavigator().push(
                        context,
                        const ProfilePage(),
                      );
                    },
                    child: const UserWidget(),
                  ),
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
                          "${Prefs.getStringList("user")![1]} ${Prefs.getStringList("user")![2]}",
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
            ),
            actions: <Widget>[
              CustomAnimatedOpacity(
                child: IconButton(
                  onPressed: () {
                    AnimatedNavigator().push(
                      context,
                      const NotificationsScreen(),
                    );
                  },
                  icon: const Icon(
                    IconlyLight.notification,
                    weight: 25,
                  ),
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: CustomAnimatedOpacity(
            child: BlocBuilder<SmartWatchCubit, SmartWatchState>(
              builder: (context, state) {
                final smartData =
                    context.read<SmartWatchCubit>().smartWatchData;
                return Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<UserDataInfoCubit, UserDataInfoState>(
                    builder: (context, state) {
                      final userData =
                          context.read<UserDataInfoCubit>().userData;
                      var date = userData?.birthdate.year;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomPropertiesCard(
                            label1: "${userData?.height ?? "_"}cm",
                            label2: "Height",
                          ),
                          CustomPropertiesCard(
                            label1: "${userData?.weight ?? "_"}kg",
                            label2: "Weight",
                          ),
                          CustomPropertiesCard(
                            label1:
                                "${date != null ? DateTime.now().year - date : "_"}yo",
                            label2: "Age",
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 40,
                          bottom: 15,
                        ),
                        child: Container(
                          width:
                              MediaQuery.of(context).size.width * (184 / 428),
                          height:
                              MediaQuery.of(context).size.height * (215 / 926),
                          decoration: BoxDecoration(
                            color: purple5,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 8,
                                      right: 3,
                                    ),
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
                              const SizedBox(height: 7),
                              Center(
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 1),
                                  duration: const Duration(seconds: 3),
                                  builder: (context, value, _) => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: CircularProgressIndicator(
                                          value: (value <=
                                                  (smartData?.activeCalories ??
                                                          0) /
                                                      100)
                                              ? value
                                              : (smartData?.activeCalories ??
                                                      0) /
                                                  100,
                                          backgroundColor: gray21,
                                          color: white,
                                          strokeWidth: 12.0,
                                          strokeCap: StrokeCap.round,
                                        ),
                                      ),
                                      Positioned(
                                        top: 33,
                                        child: Text(
                                          smartData?.activeCalories.toStringAsFixed(2) ?? "0",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 65,
                                        child: Text(
                                          "kCal",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: white,
                                          ),
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8, top: 50),
                            child: CustomCircleInfo(
                              label: "Diet",
                              color: orange,
                              progress: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, top: 17),
                            child: CustomCircleInfo(
                              label: "Workout",
                              color: green1,
                              progress: 59,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, top: 17),
                            child: CustomCircleInfo(
                              label: "Focus",
                              color: yellow1,
                              progress: 34,
                            ),
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
                          width:
                              MediaQuery.of(context).size.width * (184 / 428),
                          height:
                              MediaQuery.of(context).size.height * (170 / 926),
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
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 12),
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
                                radius: MediaQuery.of(context).size.width *
                                    (57 / 428),
                                lineWidth: 6.0,
                                percent: ((smartData?.steps.toDouble() ?? 0) /
                                    30000),
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
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${smartData?.steps ?? 0}",
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
                            width:
                                MediaQuery.of(context).size.width * (184 / 428),
                            height: MediaQuery.of(context).size.height *
                                (170 / 926),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 24.53,
                                          top: 12,
                                        ),
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
                                            text: "${smartData?.sleep ?? "0"}",
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
                                                  color: gray3,
                                                ),
                                              ),
                                              TextSpan(
                                                text: smartData?.sleep == null
                                                    ? "0"
                                                    : "20",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: gray3,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "m",
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10,
                                                  color: gray3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                                  width: MediaQuery.of(context).size.width *
                                      (130 / 428),
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
                          width:
                              MediaQuery.of(context).size.width * (184 / 428),
                          height:
                              MediaQuery.of(context).size.height * (170 / 926),
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
                                      padding: const EdgeInsets.only(
                                        left: 24.53,
                                        top: 12,
                                      ),
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
                                      padding: const EdgeInsets.only(
                                        left: 24.53,
                                        top: 4,
                                      ),
                                      child: Text(
                                        "${smartData?.heartRate ?? "_"} BPM",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: gray3,
                                        ),
                                      ),
                                    ),
                                    smartData?.heartRate == null ||
                                            smartData?.heartRate == 0
                                        ? Container(
                                            color: purple5,
                                            margin:
                                                const EdgeInsets.only(top: 30),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                (184 / 428),
                                            height: 2,
                                          )
                                        : const HeartGraph(),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * (184 / 428),
                            height: MediaQuery.of(context).size.height *
                                (170 / 926),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 24.53,
                                          top: 12,
                                        ),
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
                                        padding: const EdgeInsets.only(
                                            left: 24.53, top: 4),
                                        child: Text(
                                          "${smartData?.waterL.floorToDouble() ?? "_"} L",
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              (33 / 428),
                                        ),
                                        Positioned(
                                          top: 3,
                                          child: Icon(
                                            Icons.add,
                                            color: blue2,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      AnimatedNavigator().push(context, TipsAndTricksScreen());
                    },
                    child: const TipsAndTricksWidget(
                      imageUrl: "assets/images/walking.jfif",
                      label1: "Sport",
                      label2: "How Fit Can You Get From Just\n",
                      label3: "Walking?",
                      label4:
                          "walking is good for you, obviously, But can\nit whip you into shape ",
                      label5: "5 Min read",
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
