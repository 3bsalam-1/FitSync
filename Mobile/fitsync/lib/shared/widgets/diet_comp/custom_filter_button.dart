import 'package:fitsync/screens/Diet/filter_diet_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomFilterButton extends StatefulWidget {
  final String label;
  String value;
   CustomFilterButton({super.key, required this.label,required this.value});

  @override
  State<CustomFilterButton> createState() => _CustomFilterItemState();
}

class _CustomFilterItemState extends State<CustomFilterButton> {
  bool isSelected = false;
  //String value="";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 15),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            if(isSelected){
              nutrientType = widget.value;
              dietType=widget.value;
            }
            else{
              nutrientType="";
              dietType="";
            }
            
            //value=widget.label;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: isSelected ? purple5 : gray13,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: isSelected ? white : gray4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
