import 'package:fitsync/cubits_logic/diet_logic/counter/counter_cubit.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/meal_tracker_widget.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global/custom_translate_text.dart';

class Page1 extends StatelessWidget {
  Page1({
    required this.diet,
    super.key,
  });
  FoodModel diet;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MealTrackerWidget(
                    imageUrl: "assets/images/Icons/weight.png",
                    width: 30,
                    height: 30,
                    h: 0,
                    label1: 'Weight',
                    label2: '300 ',
                    label3: 'g',
                    size: 18,
                  ),
                ),
                Container(
                  height: 80,
                  width: 0,
                  child: const VerticalDivider(
                    thickness: 2,
                    color: gray12,
                    width: 80,
                    indent: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 2),
                  child: MealTrackerWidget(
                    imageUrl: "assets/images/Icons/Calories.png",
                    width: 18,
                    height: 26,
                    h: 0,
                    label1: 'Calories',
                    label2: '61 ',
                    label3: 'g',
                    size: 18,
                  ),
                ),
                Container(
                  height: 80,
                  width: 0,
                  child: const VerticalDivider(
                    thickness: 2,
                    color: gray12,
                    width: 80,
                    indent: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 2),
                  child: MealTrackerWidget(
                    imageUrl: "assets/images/Icons/diet.png",
                    width: 24,
                    height: 24,
                    h: 2,
                    label1: 'Diet',
                    label2: diet.Diet.substring(0, 10),
                    label3: '',
                    size: 12,
                  ),
                ),
                Container(
                  height: 80,
                  width: 0,
                  child: const VerticalDivider(
                    thickness: 2,
                    color: gray12,
                    width: 80,
                    indent: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: MealTrackerWidget(
                    imageUrl: "assets/images/Icons/nutrient.png",
                    width: 24,
                    height: 24,
                    h: 0,
                    label1: 'Nutrient',
                    label2: diet.Nutrient,
                    label3: '',
                    size: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.sizeOf(context).width * 0.36,
                height: 35,
                decoration: BoxDecoration(
                  color: purple5,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (context.read<CounterCubit>().index >= 1) {
                              context.read<CounterCubit>().index--;
                              context.read<CounterCubit>().ontap();
                            }
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: white,
                            size: 15,
                          ),
                        ),
                        customTranslateText(
                          (context.read<CounterCubit>().index).toString(),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<CounterCubit>().index++;
                            context.read<CounterCubit>().ontap();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: white,
                            size: 15,
                          ),
                        ),
                      ],
                    );
                  },
                )),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.03,
            ),
            CustomButton(label: 'Add Meal', onPressed: () {})
          ],
        ),
      ],
    );
  }
}
