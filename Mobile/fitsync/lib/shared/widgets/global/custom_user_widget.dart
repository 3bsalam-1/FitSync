import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (50 / 926),
      width: MediaQuery.of(context).size.width * (48 / 428),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [gray7, gray8]),
        shape: BoxShape.circle,
      ),
      child: Padding(
        //this padding will be you border size
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white, 
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            foregroundImage: AssetImage("assets/images/avatar.jfif"),
          ),
        ),
      ),
    );
  }
}