part of 'internet_connectivity_cubit.dart';

@immutable
sealed class InternetConnectivityState {}

final class InternetConnectivityInitial extends InternetConnectivityState {}

final class InternetConnectivityON extends InternetConnectivityState {}

final class InternetConnectivityOFF extends InternetConnectivityState {}