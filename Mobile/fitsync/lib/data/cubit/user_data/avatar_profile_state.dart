part of 'avatar_profile_cubit.dart';

@immutable
sealed class AvatarProfileState {}

final class AvatarProfileInitial extends AvatarProfileState {}

final class AvatarProfileSelected extends AvatarProfileState {
  final File? selectedImage;
  AvatarProfileSelected(this.selectedImage);
}

final class AvatarProfileFailure extends AvatarProfileState {}
