part of 'bluetooth_cubit.dart';

@immutable
sealed class BluetoothState {}

final class BluetoothInitial extends BluetoothState {}

final class BluetoothScanDevice extends BluetoothInitial {
  final List<ScanResult> devices;

  BluetoothScanDevice(this.devices);
}

final class BluetoothConnectToDevice extends BluetoothInitial {}

final class BluetoothDeviceService extends BluetoothInitial {
  final List<int> receivedData;

  BluetoothDeviceService(this.receivedData);
}

final class BluetoothFailur extends BluetoothInitial {
  final String errorText;
  final String imagePath;
  BluetoothFailur(this.errorText, this.imagePath);
}

final class ConnectedDeviceFailed extends BluetoothInitial {
  final String errorText;
  ConnectedDeviceFailed(this.errorText);
}
