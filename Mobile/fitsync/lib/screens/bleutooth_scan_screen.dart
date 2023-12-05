import 'package:fitsync/shared/widgets/custom_bluetooth_error.dart';
import 'package:fitsync/shared/widgets/custom_list_view_devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits_logic/cubit/bluetooth_cubit.dart';

class BluetoothScanScreen extends StatelessWidget {
  const BluetoothScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Scan Devices'),
      ),
      body: BlocConsumer<BluetoothCubit, BluetoothState>(
        listener: (context, state) {
          if (state is BluetoothFailur) {
            showDialog(
              barrierDismissible: false,
              context: context, 
              builder: (_) => CustomBluetoothError(
                errorText: state.error,
                imagePath: '',
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is BluetoothScanDevice) {
            return CustomListViewDevices(
              devices: state.devices,
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