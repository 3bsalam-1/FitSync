import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global/custom_translate_text.dart';

class NotificationsWidget extends StatelessWidget {
  final String imageUrl;
  final String label1;
  final String label2;
  final List<Color> colors;
  const NotificationsWidget({
    required this.imageUrl,
    required this.label1,
    required this.label2,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Container(
            height: MediaQuery.of(context).size.height * (70 / 926),
            width: MediaQuery.of(context).size.width * (70 / 428),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              shape: BoxShape.circle,
            ),
            child: Image.asset(imageUrl),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label1,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: black2,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  label2,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: gray4,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: PopupMenuButton(
            onSelected: (value) {
              print('Selected: $value');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option_1',
                child: Text('Option 1'),
              ),
              PopupMenuItem<String>(
                value: 'option_2',
                child: Text('Option 2'),
              ),
              PopupMenuItem<String>(
                value: 'option_3',
                child: Text('Option 3'),
              ),
            ],
            iconColor: gray3,
            color: white,
          ),
        ),
      ],
    );
  }
}
