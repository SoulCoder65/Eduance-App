import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Helpers
import '../../utils/constants/colors.dart';

final colorpallete = ColorPallete();

//  Title Widget
Widget title(double screenWidth) {
  return Container(
      width: screenWidth,
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "E",
              style: GoogleFonts.montserrat(
                  fontSize: 50,
                  color: colorpallete.logoColor,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: "DUA",
                    style: GoogleFonts.montserrat(
                        color: colorpallete.primaryText, fontSize: 35)),
                TextSpan(
                    text: "NCE",
                    style: GoogleFonts.montserrat(
                        color: colorpallete.logoColor, fontSize: 35)),
              ]),
        ),
      ));
}