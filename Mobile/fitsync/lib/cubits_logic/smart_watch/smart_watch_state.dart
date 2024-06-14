part of 'smart_watch_cubit.dart';

@immutable
sealed class SmartWatchState {}

final class SmartWatchInitial extends SmartWatchState {}

final class SmartWatchConnection extends SmartWatchState {}

final class SmartWatchAlreadyConnected extends SmartWatchState {
  void showSucceussdialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(seconds: 2),
        backgroundColor: black.withOpacity(0.3),
        content: const CustomSnackbarMessage(
          title: 'Info message',
          subTitle: "The App Connected To Smart Watch Already!!",
          backColor: purple10,
          icon: Icons.info,
        ),
      ),
    );
  }
}

final class SmartWatchData extends SmartWatchState {}

final class SmartWatchSaveWaterData extends SmartWatchState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: black.withOpacity(0.3),
        content: const CustomSnackbarMessage(
          title: 'Info message',
          subTitle: "The water Data are Saved correctly",
          backColor: purple10,
          icon: Icons.info,
        ),
      ),
    );
  }
}

final class SmartWatchSaveDistanceData extends SmartWatchState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: black.withOpacity(0.3),
        content: const CustomSnackbarMessage(
          title: 'Info message',
          subTitle: "The steps Data are Saved correctly",
          backColor: purple10,
          icon: Icons.info,
        ),
      ),
    );
  }
}

final class SmartWatchSaveSleepData extends SmartWatchState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: black.withOpacity(0.3),
        content: const CustomSnackbarMessage(
          title: 'Info message',
          subTitle: "The sleep Data are Saved correctly",
          backColor: purple10,
          icon: Icons.info,
        ),
      ),
    );
  }
}