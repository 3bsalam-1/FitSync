import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits_logic/workouts/week_dates.dart';
import '../../../../services/week_dates.dart';
import '../../../colors/colors.dart';

class CustomDayItem extends StatelessWidget {
  const CustomDayItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 100,
      width: width,
      child: BlocBuilder<WeekDatesCubit, List<Map<int, String>>>(
        builder: (context, state) {
          return Center(
            child: ListView.builder(
                itemCount: state.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: width / getWeekDates().length - 14,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: black2.withOpacity(0.08),
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: state[index][0]! == DateTime.now().day.toString()
                        ? [
                          purple2,
                          cyan,
                        ]: [
                          white,
                          white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter, 
                      ),
                      
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state[index][0]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: getWeekDates()[index][0]! ==
                                      DateTime.now().day.toString()
                                  ? white
                                  : gray4,
                            ),
                          ),
                          Text(
                            getWeekDates()[index][1]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: getWeekDates()[index][0]! ==
                                      DateTime.now().day.toString()
                                  ? white
                                  : gray4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
