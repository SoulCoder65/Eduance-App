import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Helpers
import '../../utils/constants/colors.dart';
final colorpallete = ColorPallete();

//  Submit Button
Widget submitBtn(BuildContext context, double screenWidth,String text,Function actionFunction) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      color: colorpallete.bgColor,
      padding: const EdgeInsets.only(top: 12.0,bottom: 10),
      child: SizedBox(
        width: screenWidth * 0.9,
        height: 65,
        child: ElevatedButton(
          // focusNode: f5,
          child: Text(
            text,
            style: GoogleFonts.lato(
              color:colorpallete.primaryText,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
           actionFunction();
          },
          style: ElevatedButton.styleFrom(
            elevation: 2,
            primary: colorpallete.btnBgColor,
            onPrimary: Colors.black.withOpacity(0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    ),
  );
}
