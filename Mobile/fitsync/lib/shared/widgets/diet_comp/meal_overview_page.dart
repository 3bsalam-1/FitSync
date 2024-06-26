import 'package:flutter/material.dart';

class PageMeal extends StatelessWidget {
   PageMeal({
    required String this.path,
    super.key});

  String path;
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
                      path,
                      fit: BoxFit.fill,
                    ),
                  ),
                ));
  }
}