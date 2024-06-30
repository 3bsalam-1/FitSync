import 'package:fitsync/cubits_logic/diet_logic/filter_logic/cubit/filter_cubit.dart';
import 'package:fitsync/screens/Diet/diet_list.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_filter_button.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> filter1 = [];
String foodType = "";

// ignore: must_be_immutable
class FilterDietScreen extends StatelessWidget {
  final Function() filterFunc;

  FilterDietScreen({super.key, required this.filterFunc});

  // ignore: non_constant_identifier_names
  DietListScreen DietList = const DietListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: IconButton(
              onPressed: () {
                AnimatedNavigator().pop(context);
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              )),
        ),
        title: Text(
          'Filter',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: black3,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: gray4,
          ),
          child: BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text('Category'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor1();
                            isColor = false;
                            filter1 = [
                              "strawberry",
                              "mango",
                              "apple",
                              "banana"
                            ];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor
                                  ? context
                                      .read<FilterCubit>()
                                      .realbuttoncolor = gray13
                                  : context.read<FilterCubit>().realbuttoncolor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Fruits',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: context
                                            .read<FilterCubit>()
                                            .realbuttoncolor ==
                                        gray13
                                    ? gray4
                                    : white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor2();
                            isColor = false;
                            filter1 = [
                              "broccoli",
                              "chilli",
                              "tomato",
                              "potato"
                            ];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor
                                  ? context
                                      .read<FilterCubit>()
                                      .realbuttoncolor1 = gray13
                                  : context
                                      .read<FilterCubit>()
                                      .realbuttoncolor1,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Vegetables',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: context
                                            .read<FilterCubit>()
                                            .realbuttoncolor1 ==
                                        gray13
                                    ? gray4
                                    : white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor3();
                            isColor = false;
                            filter1 = [
                              "egg",
                              "kofta",
                              "apple",
                              "chicken",
                              "fish",
                              "milk",
                              "kebabs",
                              "tikka"
                            ];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor
                                  ? context
                                      .read<FilterCubit>()
                                      .realbuttoncolor2 = gray13
                                  : context
                                      .read<FilterCubit>()
                                      .realbuttoncolor2,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Protein',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: context
                                            .read<FilterCubit>()
                                            .realbuttoncolor2 ==
                                        gray13
                                    ? gray4
                                    : white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor4();
                            isColor = false;
                            filter1 = filter1 = [
                              "corn",
                              "khichdi",
                              "rice",
                              "bread",
                              "poha"
                            ];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor
                                  ? context
                                      .read<FilterCubit>()
                                      .realbuttoncolor3 = gray13
                                  : context
                                      .read<FilterCubit>()
                                      .realbuttoncolor3,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Grains',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: context
                                            .read<FilterCubit>()
                                            .realbuttoncolor3 ==
                                        gray13
                                    ? gray4
                                    : white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text('Nutrient'),
                  const SizedBox(height: 12),
                  const Column(
                    children: [
                      Row(
                        children: [
                          CustomFilterButton(label: 'Magnesium'),
                          CustomFilterButton(label: 'Protien'),
                          CustomFilterButton(label: 'Calcium'),
                        ],
                      ),
                      Row(
                        children: [
                          CustomFilterButton(label: 'Iron'),
                          CustomFilterButton(label: 'Carbohydrates'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Diet'),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      CustomFilterButton(label: 'Ketagenic'),
                      CustomFilterButton(label: 'Gluten free'),
                      CustomFilterButton(label: 'Low fat'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Dietary Type'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor5();
                            isColor = false;
                            foodType = "";
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor
                                  ? context.read<FilterCubit>().realcolor1 =
                                      gray13
                                  : context.read<FilterCubit>().realcolor1,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Omnivore',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: context.read<FilterCubit>().realcolor1 ==
                                        gray13
                                    ? gray4
                                    : white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor6();
                            isColor = false;
                            foodType = "1";
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor
                                  ? context.read<FilterCubit>().realcolor2 =
                                      gray13
                                  : context.read<FilterCubit>().realcolor2,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Vegetarian',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: context.read<FilterCubit>().realcolor2 ==
                                        gray13
                                    ? gray4
                                    : white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor7();
                            isColor = false;
                            foodType = "0";
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor
                                  ? context.read<FilterCubit>().realcolor3 =
                                      gray13
                                  : context.read<FilterCubit>().realcolor3,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Carnivore',
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: context.read<FilterCubit>().realcolor3 ==
                                        gray13
                                    ? gray4
                                    : white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                  CustomButton(
                    label: 'Done',
                    onPressed: () {
                      // DietList.filterItemsfunction();
                      filterFunc();
                      // AnimatedNavigator().push(context, DietListScreen());
                      AnimatedNavigator().pop(context);
                    },
                    horizontalPadding: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
