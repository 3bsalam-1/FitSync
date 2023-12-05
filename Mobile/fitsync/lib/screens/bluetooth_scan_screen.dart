import '../shared/widgets/custom_bluetooth_error.dart';
import 'package:fitsync/shared/widgets/custom_list_view_devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits_logic/cubit/bluetooth_cubit.dart';

class BluetoothScanScreen extends StatelessWidget {
  const BluetoothScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Devices'),
      ),
      body: BlocConsumer<BluetoothCubit, BluetoothState>(
        buildWhen: (context, state) {
          // ReBuild when this condition come true only
          return state is BluetoothScanDevice || state is BluetoothFailur;
        },
        listener: (context, state) {
          if (state is BluetoothConnectToDevice) {
            // Start for loading until the process of connection end
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                Future.delayed(const Duration(seconds: 5), () {
                  Navigator.of(_).pop(true);
                });
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is BluetoothScanDevice) {
            if (state.devices.isNotEmpty) {
              return CustomListViewDevices(
                devices: state.devices,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else if (state is BluetoothFailur) {
            return CustomBluetoothError(
              errorText: state.errorText,
              imagePath: state.imagePath,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
