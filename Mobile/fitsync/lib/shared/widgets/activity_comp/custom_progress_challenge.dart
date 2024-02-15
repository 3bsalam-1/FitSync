import 'package:flutter/material.dart';
import '../../colors/colors.dart';

class CustomProgressChallenge extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color progressColor;
  final String progress;
  final int progressPrecent;

  const CustomProgressChallenge({
    super.key,
    required this.title,
    required this.subTitle,
    required this.progress,
    required this.progressColor,
    required this.icon,
    required this.progressPrecent,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: gray9,
        ),
        boxShadow: [
          BoxShadow(
            color: gray4.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: gray4,
            ),
          ),
          Row(
            children: [
              Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: black,
                ),
              ),
              const Spacer(),
              Text(
                progress,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: gray4,
                ),
              ),
              const SizedBox(width: 7),
              CircleAvatar(
                radius: 10,
                backgroundColor: progressColor,
                child: Icon(
                  icon,
                  color: white,
                  size: 12,
                ),
              ),
              // todo here
            ],
          ),
          const SizedBox(height: 3),
          Container(
            width: width*0.5,
            height: 12,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: gray12,
            ),
            child: UnconstrainedBox(
              child: Container(
                height: 12,
                width: width*0.5*(progressPrecent/100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: progressColor,
                ),
                child: Center(
                  child: Text(
                    '$progressPrecent%',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: white,
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
