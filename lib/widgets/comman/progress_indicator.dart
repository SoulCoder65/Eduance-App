import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/colors.dart';

final colorpallete = ColorPallete();

Widget progresssSpinner(double width, double height, bool showText) {
  return Positioned(
      bottom: 0,
      child: Container(
        width: width,
        height: height,
        color: colorpallete.bgColor.withOpacity(0.3),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitSpinningLines(
              size: 60,
              color: colorpallete.primaryText,
            ),
            SizedBox(
              height: 10,
            ),
            showText
                ? AutoSizeText(
                    "Please Wait....",
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                  )
                : SizedBox()
          ],
        )),
      ));
}
