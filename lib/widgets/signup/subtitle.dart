import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Helpers
import '../../utils/Constants/colors.dart';
final colorpallete=ColorPallete();

Widget subtitleText(BuildContext context,double screenWidth,String text)
{
  return Container(
    width: screenWidth,
    child: AutoSizeText(
      text,maxLines: 2,
      style: GoogleFonts.montserrat(
        color: Color(0xFF9FA2A5),
        fontSize: 16
      ),
    ),
  );
}