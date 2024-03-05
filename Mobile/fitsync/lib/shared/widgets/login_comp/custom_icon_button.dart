import 'package:fitsync/screens/Home/home_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Icon_Button extends StatelessWidget {
  Widget principle_widget;
  final websiteUri;
  Icon_Button({
    super.key,
    required this.principle_widget,
    this.websiteUri,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(56, 56),
          shape: CircleBorder(),
          backgroundColor: gray5,
        ),
        child: principle_widget,
        onPressed: () async {
          await launchUrl(websiteUri, mode: LaunchMode.inAppBrowserView)
              .then((value) {
            

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage();}));
          });
          
        },
      ),
    );
  }
}
