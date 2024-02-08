import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/meal_overview_page.dart';
import 'package:fitsync/shared/widgets/diet_comp/meal_tracker_widget.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MealOverviewScreen extends StatelessWidget {
  MealOverviewScreen({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              )),
          title: Text(
            'Meal Tracker',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: black3,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: UserWidget(),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: PageView(
                controller: _controller,
                children: [
                  PageMeal(),
                  PageMeal(),
                  PageMeal(),
                  PageMeal(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: SlideEffect(
                  dotWidth: 8.0,
                  dotHeight: 8.0,
                  dotColor: gray9,
                  activeDotColor: purple5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    "Chocolate appo",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 15),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconlyBold.heart,
                        color: purple5,
                        size: 22,
                      )),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    '99% Healthy',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: gray10,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Fits in Budget',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: gray10,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 0.01,
                  indicatorColor: purple5,
                  labelColor: purple5,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  unselectedLabelColor: black,
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  tabs: [
                    Tab(child: Text('Overview')),
                    Tab(child: Text('Ingredients')),
                  ]),
            ),
            Container(
              height: 250,
              child: TabBarView(children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MealTrackerWidget(
                                imageUrl: "assets/images/Icons/Weight.png",
                                label1: 'Weight',
                                label2: '300 ',
                                label3: 'g',
                                size: 18,
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 10,
                              child: VerticalDivider(
                                thickness: 2,
                                color: gray12,
                                width: 80,
                                indent: 5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 2),
                              child: MealTrackerWidget(
                                imageUrl: "assets/images/Icons/Calories.png",
                                label1: 'Calories',
                                label2: '61 ',
                                label3: 'g',
                                size: 18,
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 10,
                              child: VerticalDivider(
                                thickness: 2,
                                color: gray12,
                                width: 80,
                                indent: 5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 2),
                              child: MealTrackerWidget(
                                imageUrl: "assets/images/Icons/Diet.png",
                                label1: 'Diet',
                                label2: 'Ketogenic ',
                                label3: '',
                                size: 12,
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 10,
                              child: VerticalDivider(
                                thickness: 2,
                                color: gray12,
                                width: 80,
                                indent: 5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 2),
                              child: MealTrackerWidget(
                                imageUrl: "assets/images/Icons/Nutrient.png",
                                label1: 'Nutrient',
                                label2: 'Magnesium ',
                                label3: '',
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: 30,
                            decoration: BoxDecoration(
                              color: purple5,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.remove,
                                    color: white,
                                    size: 15,
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add,
                                    color: white,
                                    size: 15,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                        ),
                        CustomButton(label: 'Add Meal', onPressed: () {})
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              "Ingredients That You \nWill Need",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: black2,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 12),
                            child: Text(
                              '6 items',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: gray4,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
