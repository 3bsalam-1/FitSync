import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:fitsync/shared/widgets/home_comp/custom_properties_card.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
            UserWidget(),
              Column(
                children: [
                  
                  Text(
                    "Good Morning",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: gray2,
                      // fontFamily:
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Alex Hormozi",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: black3,
                        // fontFamily:
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.notification,
                weight: 25,
              ),
            )
          ]),
      body: Column(children: [
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
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 40, bottom: 15),
              child: Container(
                width: MediaQuery.of(context).size.width * (184 / 428),
                height: MediaQuery.of(context).size.height * (205 / 926),
                decoration: BoxDecoration(
                    color: purple2, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Calories",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (184 / 428),
                height: MediaQuery.of(context).size.height * (150 / 926),
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Steps",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black4,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
