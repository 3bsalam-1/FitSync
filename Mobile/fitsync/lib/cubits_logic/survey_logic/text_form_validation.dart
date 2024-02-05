import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFormValidation extends Cubit<List<int>> {
  TextFormValidation() : super([-1, -1, -1]);

  void firstNameValidate(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      emit([1, -1, -1]);
    } else {
      emit([0, -1, -1]);
    }
  }

  void ageValidate(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      emit([1, 1, -1]);
    } else {
      emit([1, 0, -1]);
    }
  }

  void weightValidate(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      emit([1, 1, 1]);
    }else {
      emit([1, 1, 0]);
    }
  }
}
