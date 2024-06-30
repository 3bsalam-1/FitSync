import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubits_logic/navigation_page_cubit.dart';
import '../colors/colors.dart';

class ItemBottomAppBar extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onTap;
  final int indexPage;
  final double paddingLeft;

  const ItemBottomAppBar({
    super.key,
    required this.label,
    required this.icon,
    required this.indexPage,
    required this.onTap,
    this.paddingLeft = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPageCubit, Widget>(
      builder: (context, state) {
        return InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color:
                  context.read<NavigationPageCubit>().isSelected == indexPage
                    ? purple5
                    : gray7,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: EdgeInsets.only(left: paddingLeft),
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: context.read<NavigationPageCubit>().isSelected == indexPage
                      ? purple5
                      : gray7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
