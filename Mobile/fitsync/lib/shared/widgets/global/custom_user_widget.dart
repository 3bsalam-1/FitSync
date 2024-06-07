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
      decoration: const BoxDecoration(
        color: gray8,
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundColor: gray8,
        radius: 27.3,
        child: CustomImage(
          imageUrl: Prefs.getStringList("user")![3],
          width: 50,
          height: 50,
          fit: BoxFit.fill,
          iconSize: 20,
          errorColor: red,
        ),
      ),
    );
  }
}
