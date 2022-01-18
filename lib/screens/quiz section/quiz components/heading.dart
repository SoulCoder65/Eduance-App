import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Helpers
import '../../../utils/constants/colors.dart';

final colorpallete = ColorPallete();

Widget quizHomeHeading(BuildContext context, double screenWidth) {
  return Container(
    width: screenWidth,
    padding:
        EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          "Top Quiz Categories",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: colorpallete.bgColor,
              fontSize: 20),
        ),
        TextButton(
          onPressed: () {},
          child: Text("View All"),
        )
      ],
    ),
  );
}
