import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
part 'internet_connectivity_state.dart';

class InternetConnectivityCubit extends Cubit<InternetConnectivityState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetConnectivityCubit() : super(InternetConnectivityInitial()) {
    streamSubscription = connectivity.onConnectivityChanged.listen((event) {
      if (event.last == ConnectivityResult.mobile ||
          event.last == ConnectivityResult.wifi) {
        emit(InternetConnectivityON());
      } else {
        emit(InternetConnectivityOFF());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
