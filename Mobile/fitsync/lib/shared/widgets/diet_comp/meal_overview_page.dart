import 'package:flutter/material.dart';

class PageMeal extends StatelessWidget {
  const PageMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                    child: Container(
                  width: MediaQuery.of(context).size.width * (387 / 428),
                  height: MediaQuery.of(context).size.height * (266 / 926),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      "assets/images/Chocolate appo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ));
  }
}