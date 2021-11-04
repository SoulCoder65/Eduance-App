import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/state management/students/authentication.dart';
import '../../../utils/constants/colors.dart';
final colorpallete=ColorPallete();
Widget contactfield(BuildContext context, double screenWidth,StudentAuth studentAuth,isEmail) {
  return Container(
    width: screenWidth * 0.9,
    child: TextFormField(
        initialValue:isEmail?studentAuth.student_email:studentAuth.student_phone,

        style: GoogleFonts.montserrat(color: colorpallete.primaryText),
        cursorColor: colorpallete.primaryText,
        decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorpallete.borderColor, width: 1.0),
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorpallete.inactiveBorder, width: 1.0),
            ),
            fillColor: Color(0xFF121516),
            hintText: isEmail?'E-mail':'Phone number',
            hintStyle: GoogleFonts.montserrat(
                color: Color(0xFF9FA2A5), fontSize: 12),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            errorText: "")),
  );
}

//<-----------------First NameWidget ENd------------------------>
