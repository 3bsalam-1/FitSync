import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class WaterMeasure extends StatelessWidget {
  final double progress;

  const WaterMeasure({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 300 * (progress / 100),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: 45 / 180 * pi,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            cyan2,
                            purple5,
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    // todo the value of the water ML
                    '750',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 22),
          Center(
            child: Container(
              height: 58,
              width: 360,
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: cyan2,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: UnconstrainedBox(
                  child: Container(
                    height: 53,
                    width: 360 * (progress / 100) - 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: cyan6,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 9),
          Center(
            child: SizedBox(
              height: 17,
              child: ListView.builder(
                itemCount: 67,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => UnconstrainedBox(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: index.toDouble() % 6 == 0 ? 17 : 13,
                    child: VerticalDivider(
                      color: (67 * (progress / 100)).toInt() >= index
                          ? cyan6
                          : gray3,
                      thickness: 2,
                      width: 5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 9),
          const Center(
            child: SizedBox(
              width: 335,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: gray3,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Poor'),
                    Text('Good'),
                    Text('Almost'),
                    Text('Perfect!'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
