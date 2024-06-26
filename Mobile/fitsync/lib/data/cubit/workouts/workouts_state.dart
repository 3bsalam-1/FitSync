part of 'workouts_cubit.dart';

@immutable
sealed class WorkoutsState {}

final class WorkoutsInitial extends WorkoutsState {}

final class WorkoutsLoading extends WorkoutsState {}

final class WorkoutsLoaded extends WorkoutsState {}

final class WorkoutsAddFavorite extends WorkoutsState {}

final class WorkoutsGetFavorite extends WorkoutsState {}

final class WorkoutsSelectLevel extends WorkoutsState {}

final class WorkoutsFialure extends WorkoutsState {}