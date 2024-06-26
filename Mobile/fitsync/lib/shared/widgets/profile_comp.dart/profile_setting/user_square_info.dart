import 'package:flutter/material.dart';
import '../../../../data/models/user_personal_info_model.dart';
import '../square_info.dart';

class UserSquareInfo extends StatelessWidget {
  final UserPersonalInfoGetModel? data;
  const UserSquareInfo({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SquareInfo(
          title: 'Height',
          value: '${data?.height ?? "_"}cm',
        ),
        const SizedBox(width: 10),
        SquareInfo(
          title: 'Weight',
          value: '${data?.weight ?? "_"}kg',
        ),
        const SizedBox(width: 10),
        SquareInfo(
          title: 'Age',
          value:
              '${data != null ? DateTime.now().year - data!.birthdate.year : "_"}yo',
        ),
      ],
    );
  }
}
