import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/colors.dart';

final colorpallete = ColorPallete();
Widget outlinedSubmitBtn(BuildContext context, double screenWidth, String text,
    Function actionFunction) {
  return Container(
    width: screenWidth,
    color: colorpallete.bgColor,
    child: Center(
      child: SizedBox(
        width: screenWidth * 0.9,
        height: 65,
        child: new OutlinedButton(
          style: OutlinedButton.styleFrom(
            
              primary: colorpallete.logoColor,
              padding: const EdgeInsets.all(20),
              side: BorderSide(color: colorpallete.logoColor, width: 1)),
          onPressed: () {
            actionFunction();
          },
          child: Text(
            text,
            style: GoogleFonts.lato(
              color:colorpallete.primaryText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}
