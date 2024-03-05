import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       AnimatedNavigator().pop(context);
        //     },
        //     icon: Container(
        //       width: 39,
        //       height: 39,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(30),
        //         color: purple3,
        //       ),
        //       child: const Icon(
        //         IconlyLight.arrow_left,
        //         color: white,
        //         size: 20,
        //       ),
        //     )),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
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

        backgroundColor: Colors.transparent,
      ),
      body: Stack(clipBehavior: Clip.none, children: [
        Container(
          width: MediaQuery.of(context).size.width * (436 / 428),
          height: MediaQuery.of(context).size.height * (327 / 926),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Image.asset(
              "assets/images/tipsImages/food.jfif",
              color: dark.withOpacity(0.40),
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width * (427 / 428),
            height: MediaQuery.of(context).size.height * (635 / 926),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                color: white),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * (50 / 428),
                  height: MediaQuery.of(context).size.height * (5 / 926),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: gray12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 6, right: 6),
                            //width: MediaQuery.of(context).size.width * (100 / 428),
                            height:
                                MediaQuery.of(context).size.height * (22 / 926),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: purple8),
                            child: Center(
                              child: Text(
                                "healthy Food",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: purple5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 20),
                      child: Row(
                        children: [
                          Icon(
                            IconlyLight.time_circle,
                            size: 18,
                            color: purple5,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "7 Min read",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: black2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Row(
                    children: [
                      Container(
                          height:
                              MediaQuery.of(context).size.height * (50 / 926),
                          width: MediaQuery.of(context).size.width * (48 / 428),
                          decoration: const BoxDecoration(
                              color: gray24, shape: BoxShape.circle),
                          child: Padding(
                            //this padding will be you border size
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage(
                                  "assets/images/person.jfif",
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Robert John",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: black2,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    //height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What is a healthy diet?",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: black2,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width:
                                MediaQuery.of(context).size.width * (377 / 428),
                            child: Text(
                              "A healthy diet is one that provides the necessary nutrients youbody needs to function properly while maintaining overallwell-being Include a variety of fruits and vegetables in different colors to ensure a range of vitamins and minerals Choose healthy fats, such as those found in olive oil, avocados, and nuts Pay attention to portion sizes to avoid overeating Use smaller plates to help with portion control",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: black2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width:
                                MediaQuery.of(context).size.width * (377 / 428),
                            child: Text(
                              "Drink plenty of water throughout the day to stay hydrated Water is essential for many bodily functions Reduce intake of processed foods, which often contain high levels of added sugars, salt, and unhealthy fats Enjoy treats and indulgentfoods in moderation. This allows for a balanced and sustainable approach to eating If you have specific healthconcerns or conditions, it's advisable to consult withhealthcare professionals or a registered dietitian for personalized Combine a healthy diet with regular physical activity for overall health and well-being Consider any dietary restrictions or preferences you may have, such as vegetarianism, veganism, or specific health conditions",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: black2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
