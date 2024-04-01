part of 'smart_watch_cubit.dart';

@immutable
sealed class SmartWatchState {}

final class SmartWatchInitial extends SmartWatchState {}

final class SmartWatchConnection extends SmartWatchState {}

final class SmartWatchData extends SmartWatchState {}