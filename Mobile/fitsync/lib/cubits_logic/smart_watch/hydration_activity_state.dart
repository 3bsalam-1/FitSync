part of 'hydration_activity_cubit.dart';

@immutable
sealed class HydrationActivityState {}

final class HydrationActivityInitial extends HydrationActivityState {}

final class HydrationNumberGlasses extends HydrationActivityState {}

final class HydrationSaveGlasses extends HydrationActivityState {}