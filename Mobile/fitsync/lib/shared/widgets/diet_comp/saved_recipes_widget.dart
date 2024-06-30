import 'package:fitsync/cubits_logic/diet_logic/favoriteIcon/cubit/favourite_icon_cubit.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class SavedRecipesWidget extends StatelessWidget {
  final String imageUrl;
  final String label1;
  final String label2;
  Color IconColor = white;
  SavedRecipesWidget({
    super.key,
    required this.imageUrl,
    required this.label1,
    required this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.topLeft,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (163 / 428),
          height: MediaQuery.of(context).size.height * (135 / 926),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              color: black5.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: BlocBuilder<FavouriteIconCubit, FavouriteIconState>(
            builder: (context, state) {
              return IconButton(
                alignment: Alignment.topRight,
                icon: Icon(IconlyBold.heart),
                onPressed: () {
                  IconColor = IconColor == white ? purple5 : white;
                  context.read<FavouriteIconCubit>().changeIconColor();
                },
                color: IconColor,
                iconSize: 17,
              );
            },
          ),
        ),
        Positioned(
          top: 25,
          left: 8,
          child: Text(
            label1,
            style: GoogleFonts.poppins(
              
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: white,
              
            ),
          ),
        ),
        Positioned(
          left: 8,
          bottom: 34,
          child: Text(
            label2,
            style: GoogleFonts.poppins(
              
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: white,
              
            ),
          ),
        ),
        Positioned(
          top: 70,
          right: 79,
          child: TextButton(
            child: Text(
              "More Info",
              style: GoogleFonts.poppins(
               
                  fontWeight: FontWeight.w700,
                  fontSize: 7,
                  color: white,
                
              ),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
