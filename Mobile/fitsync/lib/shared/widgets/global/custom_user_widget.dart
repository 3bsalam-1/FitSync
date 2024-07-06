import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/cubit/user_data/avatar_profile_cubit.dart';
import '../../../shared/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../../services/pref.dart';
import 'custom_image.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: gray8,
        shape: BoxShape.circle,
      ),
      child: BlocBuilder<AvatarProfileCubit, AvatarProfileState>(
        builder: (context, state) => ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CustomImage(
            imageUrl: Prefs.getStringList("user")![3],
            width: 50,
            height: 50,
            fit: BoxFit.fill,
            iconSize: 20,
            border: 99,
            errorColor: red,
          ),
        ),
      ),
    );
  }
}
