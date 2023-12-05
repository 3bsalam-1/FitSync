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
          ));
        });
      }
      // The bluetooth is turn on
      if (state == BluetoothAdapterState.on) {
        // Will start to scan for devices
        scanDevices();
      }
    });
  }

  void scanDevices() {
    // flag to check if there are devices or NOT
    bool isTheredevices = false;

    // Start for scanning devices
    FlutterBluePlus.startScan(timeout: const Duration(days: 1));
    // Show the results of the scanning devices
    FlutterBluePlus.scanResults.listen(
        (results) {
          // Devices was founded
          // active BluetoothScanDevice state
          emit(BluetoothScanDevice(results));

          if (results.isNotEmpty) {
            isTheredevices = true;
          }
        },
        onError: (_) => // No devices was founded
            emit(BluetoothFailur(
              'There Is No Devices In This Location', // Error text that will show to the user
            )),
        onDone: () {
          isTheredevices
              ? null
              : emit(BluetoothFailur(
                  'There Is No Devices In This Location', // Error text that will show to the user
                ));
        });
  }

  void connectToDevice(BluetoothDevice device) {
    // Start connect to the device
    device.connect().then((_) {
      // Active BluetoothConnectedDevice state
      discoverServicesAndData(device);
    }).timeout(
      Duration(minutes: 1),
      onTimeout: () {
        // Will show error if can NOT connect to the device
        emit(BluetoothFailur(
          'Failed To Connect To Your Device', // Error text that will show to the user
        ));
      },
    );
  }

  void discoverServicesAndData(BluetoothDevice connectedDevice) {
    List<Map<String, dynamic>> dataServices = [];
    List<int> recievedData = [];

    // To discover the services of the connected device
    connectedDevice.discoverServices().then((services) {
      for (var service in services) {
        // Add all the services and characteristics values on dataServices variable
        dataServices.add({
          "servicesUUID": service.uuid.toString(),
          "characteristicsUUID":
              service.characteristics.map((c) => c.uuid.toString()).toList(),
        });
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
      emit(BluetoothDeviceService(recievedData, dataServices));
    });
  }
}