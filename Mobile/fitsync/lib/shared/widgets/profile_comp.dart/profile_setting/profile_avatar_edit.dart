import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/user_data/avatar_profile_cubit.dart';
import '../../../../services/pref.dart';
import '../../../colors/colors.dart';
import '../../global/custom_animated_opacity.dart';
import '../../global/custom_image.dart';
import '../../global/skeleton_container_loading.dart';

class ProfileAvatarEdit extends StatelessWidget {
  const ProfileAvatarEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AvatarProfileCubit>();
    return BlocConsumer<AvatarProfileCubit, AvatarProfileState>(
      listener: (context, state) {
        if (state is AvatarProfileFailure) {
          state.showFailure(context);
          provider.imageSelected = null;
        }
        if (state is AvatarUpdateSuccess) {
          state.showSucceussdialog(context);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CustomAnimatedOpacity(
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: white,
                    child: Center(
                      child: state is AvatarProfileSelected
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: Image.file(
                                state.selectedImage!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : state is AvatarProfileLoading
                              ? const SkeletonContainerLoading(
                                  height: 100,
                                  width: 100,
                                  borderRaduis: 99,
                                  child: Icon(
                                    Icons.image,
                                    size: 45,
                                    color: gray10,
                                  ),
                                )
                              : provider.imageSelected == null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(99),
                                      child: CustomImage(
                                        imageUrl:
                                            Prefs.getStringList('user')![3],
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                        errorColor: red,
                                        iconSize: 40,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(99),
                                      child: Image.file(
                                        provider.imageSelected!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CustomAnimatedOpacity(
                    child: InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (_) => CupertinoActionSheet(
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  provider.selectImageFromGallery();
                                },
                                child: Text(
                                  'Photo Gallery',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: purple2,
                                  ),
                                ),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  provider.selectImageFromCamera();
                                },
                                child: Text(
                                  'Camera',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: purple2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: purple2,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            CustomAnimatedOpacity(
              child: Text(
                '${Prefs.getStringList('user')![1]} ${Prefs.getStringList('user')![2]}',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomAnimatedOpacity(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: white,
                    size: 20,
                  ),
                  // todo show the city name location of the user
                  Text(
                    'New York',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
