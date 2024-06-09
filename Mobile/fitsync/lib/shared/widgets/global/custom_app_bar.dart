import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../services/pref.dart';
import '../../colors/colors.dart';
import 'custom_animated_opacity.dart';
import 'custom_image.dart';

PreferredSizeWidget customAppBar(
  BuildContext context,
  String title,
  void Function()? onPressed,
) {
  return AppBar(
    backgroundColor: white,
    scrolledUnderElevation: 0,
    title: CustomAnimatedOpacity(
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 24,
          color: black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    centerTitle: true,
    leading: CustomAnimatedOpacity(
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_circle_left,
          color: purple2,
          size: 37,
        ),
      ),
    ),
    actions: [
      CustomAnimatedOpacity(
        child: Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CustomImage(
              imageUrl: Prefs.getStringList('user')![3],
              height: 48,
              width: 48,
              fit: BoxFit.fill,
              errorColor: red,
              iconSize: 20,
            ),
          ),
        ),
      ),
    ],
  );
}
