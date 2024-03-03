import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ]),
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              AnimatedNavigator().pop(context);
            },
            icon: Container(
              width: 39,
              height: 39,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: purple3,
              ),
              child: Icon(
                IconlyLight.arrow_left,
                color: white,
                size: 20,
              ),
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(clipBehavior: Clip.none, children: [
        Container(
          width: MediaQuery.of(context).size.width * (436 / 428),
          height: MediaQuery.of(context).size.height * (327 / 926),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
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
            height: MediaQuery.of(context).size.height * (545 / 926),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                color: white),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
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
                                color: purple6),
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
