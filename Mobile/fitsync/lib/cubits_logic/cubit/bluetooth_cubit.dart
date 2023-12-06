import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  BluetoothCubit() : super(BluetoothInitial());

  void checkBluetoothConnectivity() {
    // It is check for bluetooth connection
    FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) async {
      // The bluetooth is turn off
      if (state == BluetoothAdapterState.off) {
        // It is required to turn on bluetooth
        await FlutterBluePlus.turnOn().fbpEnsureAdapterIsOn('').catchError((_) {
          // Here will show error when NOT turn on the bluetooth
          emit(BluetoothFailur(
            'Please Turn On Your Bluetooth', // Error text that will show to the user
            'assets/images/blue_connection_error.png', // Error image that will show to the user
          ));
        });
      } else if (state == BluetoothAdapterState.turningOn) {
        scanDevices();
      }
      // The bluetooth is turn on
      else if (state == BluetoothAdapterState.on) {
        // Will start to scan for devices
        scanDevices();
      }
    });
  }

  void scanDevices() {
    // Will be used to check if there are devices or NOT
    List<ScanResult> devices = [];

    // Start for scanning devices
    FlutterBluePlus.startScan(timeout: const Duration(days: 1));

    // Show the results of the scanning devices
    FlutterBluePlus.scanResults.listen((results) {
      // Assign the result of scanning to the devices
      devices = results;
    });

    Future.delayed(
      // Wait 3 secondes for searching devices 
      const Duration(seconds: 3),
      () {
        // If there are NOT devices 
        if (devices.isEmpty) {
          emit(
            BluetoothFailur(
              'There Is No Devices In This Location', // Error text that will show to the user
              'assets/images/no_device_found.png', // Error image that will show to the user
            ),
          );
        // If there are devices  
        } else {
          // Devices was founded
          // active BluetoothScanDevice state
          emit(BluetoothScanDevice(devices));
        }
      },
    );
  }

  void connectToDevice(BluetoothDevice device) {
    // Active BluetoothConnectToDevice state
    emit(BluetoothConnectToDevice());

    // Start connect to the device
    device.connect().then((_) {
      // Active BluetoothConnectedDevice state
      discoverServicesAndData(device);
    }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        // Will show error if can NOT connect to the device
        emit(ConnectedDeviceFailed('Failed To Connect To The Device'));
      },
    );
  }

  void discoverServicesAndData(BluetoothDevice connectedDevice) {
    List<int> recievedData = [];

    // To discover the services of the connected device
    connectedDevice.discoverServices().then((services) {
      for (var service in services) {
        for (var c in service.characteristics) {
          if (c.uuid.toString() == '6e400001-b5a3-f393-e0a9-e50e24dcca9f') {
            c.setNotifyValue(true);
            c.lastValueStream.listen((value) {
              print('The Received Data is =============>  $value');
              recievedData = value;
            });
          }
        }
      }
      emit(BluetoothDeviceService(recievedData));
    });
  }
}
