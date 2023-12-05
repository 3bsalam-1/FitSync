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
        listener: (context, state) {
          if (state is ConnectedDeviceFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorText),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is BluetoothScanDevice) {
            return CustomListViewDevices(
              devices: state.devices,
            );
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
