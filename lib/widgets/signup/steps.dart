import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Helpers
import '../../utils/Constants/colors.dart';
final colorpallete=ColorPallete();
Widget stepsWidget(BuildContext context,double screenWidth,String stepnum)
{
  return Container(
    width: screenWidth,
    child: Row(
      children: [
        Text("STEP $stepnum  ",style: GoogleFonts.montserrat(
          color: colorpallete.primaryText,fontWeight: FontWeight.bold
        ),),
        Text(" /   03",style: GoogleFonts.montserrat(
            color: colorpallete.primaryText
        ),)
      ],
    ),
  );
}