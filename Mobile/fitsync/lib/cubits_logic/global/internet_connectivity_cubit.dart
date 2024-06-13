import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../../shared/colors/colors.dart';
part 'internet_connectivity_state.dart';

class InternetConnectivityCubit extends Cubit<InternetConnectivityState> {
  Connectivity connectivity = Connectivity();
  dynamic data;
  StreamSubscription? streamSubscription;

  InternetConnectivityCubit() : super(InternetConnectivityInitial()) {
    // connectivity.checkConnectivity().then((value) {
    //    if (value.last == ConnectivityResult.mobile || value.last == ConnectivityResult.wifi) {
    //     emit(InternetConnectivityON());
    //   } else if (data == null) {
    //     emit(InternetConnectivityOFF());
    //   } else {
    //     emit(InternetConnectivityOFFWithData());
    //   }
    // });
    streamSubscription = connectivity.onConnectivityChanged.listen((event) {
      if (event.last == ConnectivityResult.mobile ||
          event.last == ConnectivityResult.wifi) {
        emit(InternetConnectivityON());
      } else if (data == null) {
        emit(InternetConnectivityOFF());
      } else {
        emit(InternetConnectivityOFFWithData());
      }
    });
  }

  checkIfHasData(dynamic enteredData) {
    data = enteredData;
    emit(InternetConnectivityInitial());
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
