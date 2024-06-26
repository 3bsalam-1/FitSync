import 'package:fitsync/cubits_logic/diet_logic/counter/counter_cubit.dart';
import 'package:fitsync/data/models/ingrediant_cals_model.dart';
import 'package:fitsync/data/repository/food/ingrediant_cals.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

int weight = 0;
int calories=0;


class CustomIngredientsWidget extends StatelessWidget {
  //final String imageUrl;
  final String label1;
  //int weight=0;
  int num;
  int ind;
  double cal=0;
  

  CustomIngredientsWidget({
    super.key,
    // required this.imageUrl,
    required this.label1,
    required this.num,
    required this.ind,
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width * (80 / 428),
                  //   height: MediaQuery.of(context).size.height * (80 / 926),
                  //   decoration: BoxDecoration(
                  //     color: gray19,
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: Image.asset(imageUrl),
                  // ),

                  Text(
                    label1,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: black2,
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "${num} gm",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: gray4,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 8, bottom: 25),
                  child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purple5,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (num >= 1) {
                                num -= 50;
                                context.read<CounterCubit>().ontap();
                                count1[ind] = num;
                                weight -= 50;

                              List<IngrediantModel>ingredintCals=[];
                              List<String>words=[];
                              words= label1.split(' ');

                              fun()async{
                               int i=0;
                               while(i<words.length){
                                ingredintCals= await IngredientCalories().getIngrediantCalories(words[i++]);
                                if(!ingredintCals.isEmpty){
                                calories-=(int.parse(ingredintCals[0].caloriesPer100Grams)/2).round();

                              }
                              
                              else{
                                calories-=0;
                              }
                              
                               }

                              }

                              // run()async{
                              //   await fun();
                              //  // print(calories);

                              // }
                              // run();
                                fun();
                              }
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: white,
                              size: 13,
                            ),
                          ),
                          // Text(
                          //   num.toString(),
                          //   style: GoogleFonts.poppins(
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: 18,
                          //     color: white,
                          //   ),
                          //   textAlign: TextAlign.center,
                          // ),
                          InkWell(
                            onTap: () {
                              num += 50;
                              context.read<CounterCubit>().ontap();
                              count1[ind] = num;
                              weight += 50;

                              List<IngrediantModel>ingredintCals=[];
                              List<String>words=[];
                              words= label1.split(' ');

                              fun()async{
                               int i=0;
                               while(i<words.length){
                                ingredintCals= await IngredientCalories().getIngrediantCalories(words[i++]);
                                if(!ingredintCals.isEmpty){
                                calories+=(int.parse(ingredintCals[0].caloriesPer100Grams)/2).round();

                              }
                              
                              else{
                                calories+=0;
                              }
                              
                               }

                               
                              // print(ingredintCals[0].caloriesPer100Grams);
                             // print(ingredintCals[0].ingredient);
                               
                              }

                              // run()async{
                              //   await fun();
                              //  // print(calories);

                              // }
                              // run();
                              fun();
                              
                            },
                            child: Text(
                              '+',
                              style: TextStyle(color: white, fontSize: 15),
                            ),
                          ),
                        ],
                      ))),
            ],
          );
        },
      ),
    );
  }
}
