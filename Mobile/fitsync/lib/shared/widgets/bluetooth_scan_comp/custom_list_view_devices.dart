// has import flutter_blue_plus package so we use 'as cubit' to avoid conflict
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Can NOT delete this Becuase devices varaible which it's data type is ScanResult
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubits_logic/cubit/bluetooth_cubit.dart' as cubit;

class CustomListViewDevices extends StatelessWidget {
  final List<ScanResult> devices;
  const CustomListViewDevices({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    return BlocListener<cubit.BluetoothCubit, cubit.BluetoothState>(
      listener: (context, state) {
        if (state is cubit.BluetoothDeviceService) {
          // Navigate to the result page with the connected device
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => HomeScreen(),
          //   ),
          //   (Route<dynamic> route) => false,
          // );
        }
        if (state is cubit.ConnectedDeviceFailed) {
          // If there error in connecting tothe device show snakBar with error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorText),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(
            'Device Name: ${devices[index].device.platformName}',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: black,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            'ID: ${devices[index].device.remoteId}',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: gray4,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              // call the method of connecting the device
              context.read<cubit.BluetoothCubit>().connectToDevice(
                    devices[index].device,
                  );
            },
            child: const Text('connect'),
          ),
        ),
      ),
    );
  }
}
