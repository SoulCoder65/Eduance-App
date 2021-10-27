import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//Helpers
import '../../utils/Constants/colors.dart';
final colorpallete=ColorPallete();
Widget titleText(BuildContext context,double screenWidth)
{
  return Container(
    width: screenWidth,
    child: AutoSizeText("CREATE AN\nACCOUNT",maxLines: 2,style: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold,fontSize: 24,color: colorpallete.primaryText
    ),),
  );
}