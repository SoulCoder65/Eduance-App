import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textWidget(String content,Color color,double fontSize,{FontWeight fontWeight=FontWeight.bold})
{
  return AutoSizeText(
    content,
    style: GoogleFonts.montserrat(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize),
  );
}