import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/colors.dart';
final colorpallete=ColorPallete();

Widget custom_note(BuildContext context,double screenWidth,String text)
{
  return Container(
    width: screenWidth,
    child: AutoSizeText(
    text,
    maxLines: 5,
    textAlign: TextAlign.center,
    style: GoogleFonts.montserrat(
      color:colorpallete.primaryText.withOpacity(0.6)
    ),
    ),
  );
}