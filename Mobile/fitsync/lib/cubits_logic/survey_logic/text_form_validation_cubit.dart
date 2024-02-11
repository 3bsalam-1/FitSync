import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'text_form_validation_state.dart';

class TextFormValidationCubit extends Cubit<TextFormValidationState> {
  TextFormValidationCubit() : super(TextFormValidationInitial());

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final birthDayController = TextEditingController();
  final birthMonthController = TextEditingController();
  final birthYearController = TextEditingController();
  final weightController = TextEditingController();
  final tallController = TextEditingController();
  final bloodSugarController = TextEditingController();
  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();
  final cholesterolController = TextEditingController();
  bool isCmSelected = true;

  void nameValidate() {
    if (nameController.text.isNotEmpty) {
      if (nameController.text.length >= 4) {
        emit(NameValidation(null));
      } else {
        emit(NameValidation('The name should be more than 3 letters'));
      }
    } else {
      emit(NameValidation('Can not be empty'));
    }
  }

  void ageValidate() {
    if (ageController.text.isNotEmpty) {
      try {
        int age = int.parse(ageController.text);
        if (age >= 7 && age <= 100) {
          emit(AgeValidation(null));
        } else {
          emit(AgeValidation('The age must be between 7-100'));
        }
      } on FormatException {
        emit(AgeValidation('The age must be an integer number'));
      }
    } else {
      emit(AgeValidation('Can not be empty'));
    }
  }

  void weightValidate() {
    if (weightController.text.isNotEmpty) {
      try {
        double weight = double.parse(weightController.text);
        if (weight >= 30 && weight <= 400) {
          emit(WeightValidation(null));
        } else {
          emit(WeightValidation('The weight must be between 30-400'));
        }
      } on FormatException {
        emit(WeightValidation('The weight must be a number'));
      }
    } else {
      emit(WeightValidation('Can not be empty'));
    }
  }

  void birthDateValidate() {
    if (birthDayController.text.isNotEmpty &&
        birthMonthController.text.isNotEmpty &&
        birthYearController.text.isNotEmpty) {
      try {
        int day = int.parse(birthDayController.text);
        int month = int.parse(birthMonthController.text);
        int year = int.parse(birthYearController.text);
        if (day <= 31 &&
            day >= 1 &&
            month >= 1 &&
            month <= 12 &&
            year >= 1930 &&
            year <= 2016) {
          emit(BirthValidation(null));
        } else {
          emit(BirthValidation('Invalid birth date'));
        }
      } on FormatException {
        emit(BirthValidation('The birth date must be a number'));
      }
    } else {
      emit(BirthValidation('Can not be empty please fill the others'));
    }
  }

  void tallDateValidate() {
    if (tallController.text.isNotEmpty) {
      try {
        double tall = double.parse(tallController.text);
        if (tall >= 50 && tall <= 220 && isCmSelected) {
          emit(TallValidation(null));
        } else if (tall >= 1.64 && tall <= 7.22 && !isCmSelected) {
          emit(TallValidation(null));
        } else {
          emit(TallValidation('The value must be between 50-220'));
        }
      } on FormatException {
        emit(TallValidation('The value must be a number'));
      }
    } else {
      emit(TallValidation('Can not be empty'));
    }
  }

  void convertToCm() {
    if (!isCmSelected) {
      if (tallController.text.isNotEmpty) {
        try {
          double tall = double.parse(tallController.text);
          if (tall >= 1.64 && tall <= 7.22) {
            isCmSelected = true;
            tallController.text = (tall / 0.032808399).toStringAsFixed(2);
            emit(TallSwitchConverter(isCmSelected));
          } else {
            emit(TallValidation('The value must be between 50-220'));
          }
        } on FormatException {
          emit(TallValidation('The value must be a number'));
        }
      } else {
        emit(TallValidation('Can not be empty'));
      }
    }
  }

  void convertToFt() {
    if (isCmSelected) {
      if (tallController.text.isNotEmpty) {
        try {
          double tall = double.parse(tallController.text);
          if (tall >= 50 && tall <= 220) {
            isCmSelected = false;
            tallController.text = (tall * 0.032808399).toStringAsFixed(2);
            emit(TallSwitchConverter(isCmSelected));
          } else {
            emit(TallValidation('The value must be between 50-220'));
          }
        } on FormatException {
          emit(TallValidation('The value must be a number'));
        }
      } else {
        emit(TallValidation('Can not be empty'));
      }
    }
  }

  void bloodSugarValidate() {
    if (bloodSugarController.text.isNotEmpty) {
      try {
        double.parse(bloodSugarController.text);
        emit(BloodSugarValidation(null));
      } on FormatException {
        emit(BloodSugarValidation('The value must be a number'));
      }
    } else {
      emit(BloodSugarValidation('Can not be empty'));
    }
  }

  void systolicBloodValidate() {
    if (systolicController.text.isNotEmpty) {
      try {
        double.parse(systolicController.text);
        emit(SystolicBloodValidation(null));
      } on FormatException {
        emit(SystolicBloodValidation('The value must be a number'));
      }
    } else {
      emit(SystolicBloodValidation('Can not be empty'));
    }
  }

  void diastolicBloodValidate() {
    if (diastolicController.text.isNotEmpty) {
      try {
        double.parse(diastolicController.text);
        emit(DiastolicBloodValidation(null));
      } on FormatException {
        emit(DiastolicBloodValidation('The value must be a number'));
      }
    } else {
      emit(DiastolicBloodValidation('Can not be empty'));
    }
  }

  void cholesterolValidate() {
    if (cholesterolController.text.isNotEmpty) {
      try {
        double.parse(cholesterolController.text);
        emit(CholesterolValidation(null));
      } on FormatException {
        emit(CholesterolValidation('The value must be a number'));
      }
    } else {
      emit(CholesterolValidation('Can not be empty'));
    }
  }
}
