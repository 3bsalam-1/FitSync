part of 'favourite_meal_cubit.dart';

@immutable
sealed class FavouriteMealState {}

final class FavouriteMealInitial extends FavouriteMealState {}

final class FavoriteMealAdded extends FavouriteMealState  {}

final class FavoriteMealGetAll extends FavouriteMealState {}

final class FavoriteMealFaliure extends FavouriteMealState {}

final class ChangeColor extends FavouriteMealState {}