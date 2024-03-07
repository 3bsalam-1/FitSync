part of 'user_data_info_cubit.dart';

@immutable
sealed class UserDataInfoState {}

final class UserDataInfoInitial extends UserDataInfoState {}

final class UserDataLoading extends UserDataInfoState {}

final class UserDataLoaded extends UserDataInfoState {}

final class UserDataFailure extends UserDataInfoState {
  final String message;

  UserDataFailure(this.message);
}
