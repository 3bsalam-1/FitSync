import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_text_form_field.dart';

class WriteReminderScreen extends StatelessWidget {
  const WriteReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {
            AnimatedNavigator().pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left,
            color: purple2,
            size: 37,
          ),
        ),
      ),
      backgroundColor: white,
      body: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomTextFormField(
              hintText: 'Write a Reminder Name',
              fontSize: 22,
              textColor: gray4,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              validator: (value) {
                // todo add validation here
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomTextFormField(
              hintText: 'details about reminder',
              fontSize: 16,
              textColor: gray3,
              textAlign: TextAlign.start,
              validator: (value) {
                // todo add validation here
                return null;
              },
            ),
          ),
          const SizedBox(height: 85),
          CustomButton(
            label: 'Submit a Reminder',
            onPressed: () {
              // todo save the reminder in the server
            },
          ),
        ],
      ),
    );
  }
}
