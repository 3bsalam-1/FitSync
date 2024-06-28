import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global/custom_translate_text.dart';
import '../../../cubits_logic/smart_watch/smart_watch_cubit.dart';
import '../../../services/pref.dart';

class LinkSmartWatchButton extends StatelessWidget {
  const LinkSmartWatchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Prefs.getBool("watch-permission") != null) {
          if (Prefs.getBool("watch-permission")!) {
            context.read<SmartWatchCubit>().isSmartWatchConnected();
          }
        }
        context.read<SmartWatchCubit>().intializeSmartWatchConnection();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * (386 / 428),
        height: MediaQuery.of(context).size.height * (60 / 926),
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: purple, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Icons/watch.PNG",
              width: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Link Smart Watch",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: purple5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
