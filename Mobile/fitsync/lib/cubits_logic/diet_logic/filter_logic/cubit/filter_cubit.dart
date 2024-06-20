import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  Color realbuttoncolor = gray13;
  Color realbuttoncolor1 = gray13;
  Color realbuttoncolor2 = gray13;
  Color realbuttoncolor3 = gray13;

  Color changebuttoncolor1 = purple5;

  Color realcolor1 = gray13;
  Color realcolor2 = gray13;
  Color realcolor3 = gray13;

  changeColor1() {
    realbuttoncolor = changebuttoncolor1;
    realbuttoncolor1 = gray13;
    realbuttoncolor2 = gray13;
    realbuttoncolor3 = gray13;

    emit(FilterInitial());
  }

  changeColor2() {
    realbuttoncolor1 = changebuttoncolor1;
    realbuttoncolor = gray13;
    realbuttoncolor2 = gray13;
    realbuttoncolor3 = gray13;

    emit(FilterInitial());
  }

  changeColor3() {
    realbuttoncolor2 = changebuttoncolor1;
    realbuttoncolor = gray13;
    realbuttoncolor1 = gray13;
    realbuttoncolor3 = gray13;

    emit(FilterInitial());
  }

  changeColor4() {
    realbuttoncolor3 = changebuttoncolor1;

    realbuttoncolor = gray13;
    realbuttoncolor2 = gray13;
    realbuttoncolor1 = gray13;

    emit(FilterInitial());
  }

  // second filter
  changeColor5() {
    realcolor3 = gray13;

    realcolor2 = gray13;
    realcolor1 = changebuttoncolor1;

    emit(FilterInitial());
  }

  changeColor6() {
    realcolor3 = gray13;

    realcolor2 = changebuttoncolor1;
    realcolor1 = gray13;

    emit(FilterInitial());
  }

  changeColor7() {
    realcolor3 = changebuttoncolor1;

    realcolor2 = gray13;
    realcolor1 = gray13;

    emit(FilterInitial());
  }
}
