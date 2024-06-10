part of 'smart_watch_cubit.dart';

@immutable
sealed class SmartWatchState {}

final class SmartWatchInitial extends SmartWatchState {}

final class SmartWatchConnection extends SmartWatchState {}
final class SmartWatchHaveData extends SmartWatchState {
  void showSucceussdialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(seconds: 3),
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
