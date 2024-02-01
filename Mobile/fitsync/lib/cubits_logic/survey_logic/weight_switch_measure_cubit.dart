import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'weight_switch_measure_state.dart';

class WeightSwitchMeasureCubit extends Cubit<WeightSwitchMeasureInitial> {
  WeightSwitchMeasureCubit(): super(WeightSwitchMeasureInitial(
    TextEditingController(), 
    true,
  ));

  void convertToKg(TextEditingController controller) {
    String kg = controller.text;
    kg = (double.parse(kg) / 2.2).toStringAsFixed(2);
    controller.text = kg;
    emit(WeightSwitchMeasureInitial(controller, true));
  }

  void convertToBs(TextEditingController controller) {
    String bs = controller.text;
    bs = (double.parse(bs) * 2.2).toStringAsFixed(2);
    controller.text = bs;
    emit(WeightSwitchMeasureInitial(controller, false));
  }
}
