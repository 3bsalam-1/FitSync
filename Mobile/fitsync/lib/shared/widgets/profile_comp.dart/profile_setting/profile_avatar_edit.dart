import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/cubit/user_data/avatar_profile_cubit.dart';
import '../../../../services/pref.dart';
import '../../../colors/colors.dart';
import '../../global/custom_image.dart';

class ProfileAvatarEdit extends StatelessWidget {
  const ProfileAvatarEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: white,
              child: Center(
                child: BlocBuilder<AvatarProfileCubit, AvatarProfileState>(
                  builder: (context, state) {
                    if (state is AvatarProfileSelected) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Image.file(
                          state.selectedImage!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: CustomImage(
                          imageUrl: Prefs.getStringList('user')![3],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorColor: red,
                          iconSize: 40,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (_) => CupertinoActionSheet(
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context
                                .read<AvatarProfileCubit>()
                                .selectImageFromGallery();
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
                            context
                                .read<AvatarProfileCubit>()
                                .selectImageFromCamera();
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
          ],
        ),
        const SizedBox(height: 7),
        Text(
          '${Prefs.getStringList('user')![1]} ${Prefs.getStringList('user')![2]}',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
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
        const SizedBox(height: 12),
      ],
    );
  }
}
