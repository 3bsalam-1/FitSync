import 'package:fitsync/cubits_logic/diet_logic/filter_logic/cubit/filter_cubit.dart';
import 'package:fitsync/screens/Diet/diet_list.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_filter_button.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_button.dart';
import 'package:fitsync/shared/widgets/global/custom_translate_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> filter1=[];
String foodType="";
String nutrientType="";
String dietType="";

class FilterDietScreen extends StatelessWidget {

  final Function() filterFunc;


   FilterDietScreen({super.key,
   required this.filterFunc
   });
  
  DietListScreen DietList = DietListScreen();
  

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
        title: customTranslateText(
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
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: gray4,
          ),
          child: BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  customTranslateText('Category'),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor1();
                            isColor=false;
                            filter1=["strawberry","mango","apple","banana"];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:isColor?context.read<FilterCubit>().realbuttoncolor=gray13:
                                  context.read<FilterCubit>().realbuttoncolor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: customTranslateText(
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
                            isColor=false;
                            filter1=["broccoli","chilli","tomato","potato"];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:isColor?context.read<FilterCubit>().realbuttoncolor1=gray13:
                                  context.read<FilterCubit>().realbuttoncolor1,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: customTranslateText(
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
                            isColor=false;
                            filter1=["egg","kofta","apple","chicken","fish","milk","kebabs","tikka"];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:isColor?context.read<FilterCubit>().realbuttoncolor2=gray13:
                                  context.read<FilterCubit>().realbuttoncolor2,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: customTranslateText(
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
                            isColor=false;
                            filter1=filter1=["corn","khichdi","rice","bread","poha"];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:isColor?context.read<FilterCubit>().realbuttoncolor3=gray13:
                                  context.read<FilterCubit>().realbuttoncolor3,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: customTranslateText(
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
                  customTranslateText('Nutrient'),
                  SizedBox(height: 12),
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomFilterButton(label: 'Magnesium',value: "magnesium",),
                          CustomFilterButton(label: 'Protien',value: "protien",),
                          CustomFilterButton(label: 'Calcium',value: "calcium",),
                          
                        ],
                      ),
                      Row(
                        children: [
                          CustomFilterButton(label: 'Iron',value: "iron",),
                          CustomFilterButton(label: 'Carbohydrates',value: "carbohydrates",),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  customTranslateText('Diet'),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      CustomFilterButton(label: 'Ketagenic',value: "ketogenic_diet vegan_diet high_fiber_diet high_protien_diet dash_diet",),
                      CustomFilterButton(label: 'Gluten free',value: "high_protien_diet low_fat_diet gluten_free_diet",),
                      CustomFilterButton(label: 'Low fat',value: "low_fat_diet gluten_free_diet high_fiber_diet high_protien_diet dash_diet",),
                    ],
                  ),
                  SizedBox(height: 12),
                  customTranslateText('Dietary Type'),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 15),
                        child: InkWell(
                          onTap: () {
                            context.read<FilterCubit>().changeColor5();
                            isColor=false;
                            foodType="";
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor?context.read<FilterCubit>().realcolor1=gray13:
                              context.read<FilterCubit>().realcolor1,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: customTranslateText(
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
                            isColor=false;
                            foodType="1";
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: isColor?context.read<FilterCubit>().realcolor2=gray13:
                              context.read<FilterCubit>().realcolor2,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: customTranslateText(
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
                            isColor=false;
                            foodType="0";
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color:isColor?context.read<FilterCubit>().realcolor3=gray13:
                               context.read<FilterCubit>().realcolor3,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: customTranslateText(
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
