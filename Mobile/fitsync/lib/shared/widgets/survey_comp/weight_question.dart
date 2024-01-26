import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../colors/colors.dart';
import '../global/custom_button.dart';
import 'custom_text_form_field.dart';

class WeightQuestion extends StatelessWidget {
  const WeightQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What’s Your Weight?',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: black,
          ),
        ),
        const Spacer(),
        const CustomTextFormField(
          hintText: '0',
        ),
        ToggleSwitch(
          cornerRadius: 20.0,
          activeBgColors: const [
            [white],
            [white],
          ],
          borderColor: const [purple2],
          borderWidth: 1,
          activeFgColor: black,
          inactiveBgColor: purple2,
          inactiveFgColor: white,
          initialLabelIndex: 1,
          totalSwitches: 2,
          labels: const ['kg', '1bs'],
          customTextStyles: const [
            TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ],
          radiusStyle: true,
          onToggle: (index) {
            // TODO here
            print('switched to: $index');
          },
        ),
        const Spacer(),
        CustomButton(
          label: 'Continue',
          horizontalPadding: 0,
          onPressed: () {
            // TODO
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
