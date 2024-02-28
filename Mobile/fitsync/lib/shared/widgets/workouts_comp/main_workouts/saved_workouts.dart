import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colors/colors.dart';

class SavedWorkOuts extends StatelessWidget {
  const SavedWorkOuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Saved Workouts',
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: black,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {
                // ToDo show all the saved workouts
              },
              child: Text(
                'View all',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: purple2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        SizedBox(
          height: 180,
          child: ListView.separated(
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 30),
              itemBuilder: (context, index) {
                return Container(
                  width: 250,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: black,
                    image: const DecorationImage(
                      opacity: 0.6,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/pullup.png',
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Text(
                                'Pull up exercise',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: 130,
                              child: Text(
                                'Finish this exercise in 15 minutes',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: Icon(
                          Icons.favorite,
                          color: white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
