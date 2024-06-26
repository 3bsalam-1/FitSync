import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits_logic/global/internet_connectivity_cubit.dart';
import '../../data/cubit/workouts/filters_workouts_cubit.dart';
import '../../data/models/workouts_model.dart';
import '../../shared/colors/colors.dart';
import '../../shared/widgets/global/animated_navigator.dart';
import '../../shared/widgets/global/custom_animated_opacity.dart';
import '../../shared/widgets/global/custom_translate_text.dart';
import '../../shared/widgets/global/error_internet_connection.dart';
import '../../shared/widgets/workouts_comp/workouts_list/custom_workouts_list.dart';
import '../../shared/widgets/workouts_comp/workouts_list/text_form_search.dart';
import '../home_main_screen.dart';
import 'filters_workouts_screen.dart';

class WorkoutsListSearchScreen extends StatelessWidget {
  const WorkoutsListSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        AnimatedNavigator().pushAndRemoveUntil(
          context,
          const HomeMainScreen(),
        );
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: white,
          title: customTranslateText(
            'Workout List',
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              AnimatedNavigator().pushAndRemoveUntil(
                context,
                const HomeMainScreen(),
              );
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              color: purple2,
              size: 37,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Future.delayed(const Duration(milliseconds: 300), () {
                    AnimatedNavigator().push(
                      context,
                      const FiltersWorkoutsScreen(),
                    );
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        spreadRadius: 1,
                        color: gray4.withOpacity(0.08),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/Icons/filter_icon.png',
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: CustomAnimatedOpacity(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const TextFormSearch(),
                  const SizedBox(height: 40),
                  BlocBuilder<InternetConnectivityCubit,
                      InternetConnectivityState>(
                    builder: (context, state) {
                      if (state is InternetConnectivityOFF) {
                        return const ErrorInternetConnection();
                      }
                      return BlocBuilder<FiltersWorkoutsCubit,
                          List<WorkoutsModel>>(
                        builder: (context, state) {
                          final provider = context.read<FiltersWorkoutsCubit>();
                          if (provider.input.text.isNotEmpty &&
                              provider.isSearched) {
                            if (state.isNotEmpty) {
                              return const CustomWorkoutsList();
                            }
                            return customTranslateText(
                              "No Result",
                              style: GoogleFonts.poppins(
                                color: gray3,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          } else if (provider.input.text.isNotEmpty &&
                              !provider.isSearched) {
                            return const SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                color: purple5,
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
