part of 'internet_connectivity_cubit.dart';

@immutable
sealed class InternetConnectivityState {}

final class InternetConnectivityInitial extends InternetConnectivityState {}

final class InternetConnectivityON extends InternetConnectivityState {}

final class InternetConnectivityOFF extends InternetConnectivityState {}

final class InternetConnectivityOFFWithData extends InternetConnectivityState {
  void showDialog(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(days: 1),
        backgroundColor: gray10,
        content: Text(
          "There is no internet connection",
          style: TextStyle(
            color: white,
          ),
        ),
      ),
    );
  }
}
