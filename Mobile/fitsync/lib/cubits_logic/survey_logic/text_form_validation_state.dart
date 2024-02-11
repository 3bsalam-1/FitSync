part of 'text_form_validation_cubit.dart';

@immutable
sealed class TextFormValidationState {}

final class TextFormValidationInitial extends TextFormValidationState {}

final class NameValidation extends TextFormValidationState {
  final String? errorText;
  NameValidation(this.errorText);
}

final class AgeValidation extends TextFormValidationState {
  final String? errorText;
  AgeValidation(this.errorText);
}

final class WeightValidation extends TextFormValidationState {
  final String? errorText;
  WeightValidation(this.errorText);
}

final class BirthValidation extends TextFormValidationState {
  final String? errorText;
  BirthValidation(this.errorText);
}

final class TallValidation extends TextFormValidationState {
  final String? errorText;
  TallValidation(this.errorText);
}

final class TallSwitchConverter extends TextFormValidationState {
  final bool isCmSelected;
  TallSwitchConverter(this.isCmSelected);
}

final class BloodSugarValidation extends TextFormValidationState {
  final String? errorText;
  BloodSugarValidation(this.errorText);
}

final class SystolicBloodValidation extends TextFormValidationState {
  final String? errorText;
  SystolicBloodValidation(this.errorText);
}

final class DiastolicBloodValidation extends TextFormValidationState {
  final String? errorText;
  DiastolicBloodValidation(this.errorText);
}

final class CholesterolValidation extends TextFormValidationState {
  final String? errorText;
  CholesterolValidation(this.errorText);
}

