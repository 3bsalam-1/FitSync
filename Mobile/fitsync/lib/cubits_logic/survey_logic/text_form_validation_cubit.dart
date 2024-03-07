import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../services/pref.dart';
part 'text_form_validation_state.dart';

class TextFormValidationCubit extends Cubit<TextFormValidationState> {
  TextFormValidationCubit() : super(TextFormValidationInitial());

  final ageController = TextEditingController();
  String birthDateController = '';
  final weightController = TextEditingController();
  final tallController = TextEditingController();
  final bloodSugarController = TextEditingController();
  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();
  final cholesterolController = TextEditingController();
  bool isCmSelected = true;
  bool isKgSelected = true;

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
        if (weight >= 30 && weight <= 400 && isKgSelected) {
          emit(WeightValidation(null));
        } else if (weight >= 66 && weight <= 880 && !isKgSelected) {
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

  void convertToKg() {
    if (!isKgSelected) {
      if (weightController.text.isNotEmpty) {
        try {
          double weight = double.parse(weightController.text);
          if (weight >= 30 && weight <= 400) {
            isKgSelected = true;
            weightController.text = (weight / 2.2).toStringAsFixed(2);
            emit(WeightSwitchConverter(isKgSelected));
          } else {
            emit(WeightValidation('The weight must be between 30-400 kg'));
          }
        } on FormatException {
          emit(WeightValidation('The value must be a number'));
        }
      }
    }
  }

  void convertToBs() {
    if (isKgSelected) {
      if (weightController.text.isNotEmpty) {
        try {
          double weight = double.parse(weightController.text);
          if (weight >= 30 && weight <= 400) {
            isKgSelected = false;
            weightController.text = (weight * 2.2).toStringAsFixed(2);
            emit(WeightSwitchConverter(isKgSelected));
          } else {
            emit(WeightValidation('The weight must be between 66-880 bs'));
          }
        } on FormatException {
          emit(WeightValidation('The value must be a number'));
        }
      }
    }
  }

  void birthDateValidate() {
    if (birthDateController.isNotEmpty) {
      emit(BirthValidation(null));
    } else {
      emit(BirthValidation('Can not be empty please select birth date'));
    }
  }
  
  void updateBirthDateValue(String value) {
    birthDateController = value;
    emit(TextFormValidationInitial());
  }

  void tallDateValidate() {
    if (tallController.text.isNotEmpty) {
      try {
        double tall = double.parse(tallController.text);
        if (tall >= 50 && tall <= 220 && isCmSelected) {
          Prefs.setString('tall', tallController.text);
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
            emit(TallValidation('The value must be between 50-220 cm'));
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
            emit(TallValidation('The value must be between 1.64-7.21 ft'));
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
