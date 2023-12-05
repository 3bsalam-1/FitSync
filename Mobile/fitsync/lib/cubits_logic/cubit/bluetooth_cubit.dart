import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  BluetoothCubit() : super(BluetoothInitial());
}
