import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/workouts_model.dart';

class FiltersWorkoutsCubit extends Cubit<List<WorkoutsModel>> {
  FiltersWorkoutsCubit() : super([]);
  List<String> selectedCat = [];
  List<String> selectedMus = [];
  List<String> selectedLev = [];
  List<String> namesResults = [];
  List<WorkoutsModel> searchResult = [];
  var input = TextEditingController();
  bool isSearched = true;

  void filterSelectedCat(String category) {
    if (selectedCat.contains(category)) {
      selectedCat.remove(category);
    } else {
      selectedCat.add(category);
    }
    emit([]);
  }

  void filterSelectedMus(String muscle) {
    if (selectedMus.contains(muscle)) {
      selectedMus.remove(muscle);
    } else {
      selectedMus.add(muscle);
    }
    emit([]);
  }

  void filterSelectedLev(String level) {
    if (selectedLev.contains(level)) {
      selectedLev.remove(level);
    } else {
      selectedLev.add(level);
    }
    emit([]);
  }

  void filterWorkouts(Map<String, List<WorkoutsModel>>? allWorkouts) {
    searchResult = [];
    namesResults = [];
    if (allWorkouts == null) {
      isSearched = false;
      emit([]);
    } else {
      isSearched = true;
      for (var level in selectedLev) {
        searchResult.addAll(allWorkouts[level]!.getRange(0, 10));
      }
      if (searchResult.isEmpty) {
        searchResult.addAll(allWorkouts["Beginner"]!.getRange(0, 10));
        searchResult.addAll(allWorkouts["Intermediate"]!.getRange(0, 10));
        searchResult.addAll(allWorkouts["Advanced"]!.getRange(0, 10));
        searchForMuscles();
      } else {
        searchForMuscles();
      }
      if (searchResult.isEmpty) {
        searchResult.addAll(allWorkouts["Beginner"]!.getRange(0, 10));
        searchResult.addAll(allWorkouts["Intermediate"]!.getRange(0, 10));
        searchResult.addAll(allWorkouts["Advanced"]!.getRange(0, 10));
        searchForCategory();
      } else {
        searchForCategory();
      }
      emit(searchResult);
    }
  }

  void searchForMuscles() {
    List<WorkoutsModel> workoutsMuscle = [];
    int length = 0;
    for (var workouts in searchResult) {
      length = 0;
      for (var muscle in selectedMus) {
        workouts.targetMuscle.where((element) {
          if (element.startsWith(muscle)) {
            ++length;
          }
          return true;
        });
      }
      if (length == selectedMus.length) {
        workoutsMuscle.add(workouts);
      }
    }
    if (workoutsMuscle.isNotEmpty) {
      searchResult = workoutsMuscle;
    }
  }

  void searchForCategory() {
    List<WorkoutsModel> workoutsCategory = [];
    for (var category in selectedCat) {
      for (var workouts in searchResult) {
        if (workouts.category == category) {
          workoutsCategory.add(workouts);
        }
      }
    }
    if (workoutsCategory.isNotEmpty) {
      searchResult = workoutsCategory;
    }
  }

  void searchWorkouts(Map<String, List<WorkoutsModel>>? allWorkouts) {
    if (allWorkouts == null) {
      isSearched = false;
      emit([]);
    } else {
      isSearched = true;
      if (searchResult.isEmpty) {
        searchResult.addAll(allWorkouts["Beginner"]!.getRange(0, 10));
        searchResult.addAll(allWorkouts["Intermediate"]!.getRange(0, 10));
        searchResult.addAll(allWorkouts["Advanced"]!.getRange(0, 10));
      }
      List<WorkoutsModel> categoryRes = [];
      List<WorkoutsModel> muscleRes = [];
      namesResults = [];
      if (input.text.isNotEmpty) {
        categoryRes = searchResult
            .where(
              (workouts) => workouts.category
                  .toLowerCase()
                  .trim()
                  .startsWith(input.text.toLowerCase()),
            )
            .toList();
        namesResults.addAll(categoryRes.map((e) => e.category).toList());
        if (categoryRes.isEmpty) {
          for (var workouts in searchResult) {
            for (var muscle in workouts.targetMuscle) {
              if (muscle
                  .toLowerCase()
                  .trim()
                  .startsWith(input.text.toLowerCase())) {
                muscleRes.add(workouts);
                namesResults.add(muscle);
              }
            }
          }
          emit(muscleRes);
        } else {
          emit(categoryRes);
        }
      } else {
        emit([]);
      }
    }
  }
}
