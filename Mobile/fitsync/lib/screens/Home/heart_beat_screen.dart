import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HeartBeatScreen extends StatelessWidget {
  const HeartBeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AnimatedNavigator().pop(context);
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              ),
            )),
        title: Center(
          child: Text(
            "Heart",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: black,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: UserWidget(),
          )
        ],
        backgroundColor: white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CircularPercentIndicator(
            reverse: true,
            radius: 90.0,
            lineWidth: 18.0,
            percent: 0,
            circularStrokeCap: CircularStrokeCap.round,

            // progressColor: red3,
            center: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Icon(
                  IconlyBold.heart,
                  size: 30,
                  color: red6,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "0",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: black,
                  ),
                ),
                Text(
                  "unit: BPM",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: gray4,
                  ),
                )
              ],
            ),
            linearGradient:
                LinearGradient(colors: [red3, red7.withOpacity(0.7)]),
            backgroundColor: red7.withOpacity(0.7),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (35 / 428),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Spo2",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "(spo2)",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: gray4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "0%",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: 60,
                width: 45,
                child: const VerticalDivider(
                  thickness: 1,
                  color: gray18,
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Blood",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(mmHg)",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: gray4,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "00/00",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (150 / 926),
          ),
          CustomButton(label: "Start Measuring", onPressed: () {}),
        ],
      ),
    );
  }
}
