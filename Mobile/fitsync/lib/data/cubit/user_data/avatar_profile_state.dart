part of 'avatar_profile_cubit.dart';

@immutable
sealed class AvatarProfileState {}

final class AvatarProfileInitial extends AvatarProfileState {}

final class AvatarProfileSelected extends AvatarProfileState {
  final File? selectedImage;
  AvatarProfileSelected(this.selectedImage);
}

final class AvatarProfileLoading extends AvatarProfileState {}

final class AvatarUpdateSuccess extends AvatarProfileState {
  void showSucceussdialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: purple10,
        icon: FontAwesomeIcons.circleCheck,
        title: 'Success message',
        subTitle: 'The avatar profile was updated successfully',
        contentColor: white,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

final class AvatarProfileFailure extends AvatarProfileState {
  final String message;
  AvatarProfileFailure(this.message);

  void showFailure(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackbarMessage(
        context,
        backColor: red9,
        icon: FontAwesomeIcons.triangleExclamation,
        title: 'Faliure message',
        subTitle: message,
        contentColor: white,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
