part of 'smart_watch_cubit.dart';

@immutable
sealed class SmartWatchState {}

final class SmartWatchInitial extends SmartWatchState {}

final class SmartWatchConnection extends SmartWatchState {}

final class SmartWatchAlreadyConnected extends SmartWatchState {
  void showSucceussdialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context, 
        backColor: purple10, 
        icon: Icons.info, 
        title: 'Info message',
        subTitle: 'The App Connected To Smart Watch Already!!',
        contentColor: white, 
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

final class SmartWatchData extends SmartWatchState {}

final class SmartWatchSaveWaterData extends SmartWatchState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context, 
        backColor: purple10, 
        icon: Icons.info, 
        title: 'Info message',
        subTitle: 'The water Data are Saved correctly',
        contentColor: white, 
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

final class SmartWatchSaveDistanceData extends SmartWatchState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context, 
        backColor: purple10, 
        icon: Icons.info, 
        title: 'Info message',
        subTitle: 'The steps Data are Saved correctly',
        contentColor: white, 
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

final class SmartWatchSaveSleepData extends SmartWatchState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context, 
        backColor: purple10, 
        icon: Icons.info, 
        title: 'Info message',
        subTitle: 'The sleep Data are Saved correctly',
        contentColor: white, 
        duration: const Duration(seconds: 1),
      ),
    );
  }
}