part of 'favorite_workouts_cubit.dart';

@immutable
sealed class FavoriteWorkoutsState {}

final class FavoriteWorkoutsInitial extends FavoriteWorkoutsState {}

final class FavoriteWorkoutsAdded extends FavoriteWorkoutsState {}

final class FavoriteWorkoutsGetAll extends FavoriteWorkoutsState {}

final class FavoriteWorkoutsFaliure extends FavoriteWorkoutsState {}
