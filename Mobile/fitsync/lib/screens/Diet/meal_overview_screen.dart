import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/meal_overview_page.dart';
import 'package:fitsync/shared/widgets/diet_comp/page1.dart';
import 'package:fitsync/shared/widgets/diet_comp/page2.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MealOverviewScreen extends StatelessWidget {
  MealOverviewScreen({required this.diet, super.key});

  final _controller = PageController();
  FoodModel diet;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 6),
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
          title: Text(
            'Meal Tracker',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: black3,
            ),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: UserWidget(),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _controller,
                children: [
                  PageMeal(
                    path: "assets/images/food/${diet.Catagory}1.jpg",
                  ),
                  PageMeal(
                    path: "assets/images/food/${diet.Catagory}1.jpg",
                  ),
                  PageMeal(
                    path: "assets/images/food/${diet.Catagory}1.jpg",
                  ),
                  PageMeal(
                    path: "assets/images/food/${diet.Catagory}1.jpg",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: const SlideEffect(
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
                  child: SizedBox(
                    width: 270,
                    child: Text(
                      diet.Name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: black,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 15),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
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
                    'Healthy',
                    style: GoogleFonts.poppins(
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
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: gray10,
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 0.01,
                indicatorColor: purple5,
                labelColor: purple5,
                labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                unselectedLabelColor: black,
                unselectedLabelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                tabs: const [
                  Tab(child: Text('Overview')),
                  Tab(child: Text('Ingredients')),
                ]),
            SizedBox(
              height: 250,
              child: TabBarView(children: [
                Page1(
                  diet: diet,
                ),
                Page2(diet: diet)
              ]),
            )
          ],
        ),
      ),
    );
  }
}
