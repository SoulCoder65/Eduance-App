import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/state management/students/authentication.dart';
import '../../../utils/constants/colors.dart';

final colorpallete=ColorPallete();
//<-----------------Password Input Widget ------------------------>
Widget passwordField(BuildContext context,double screenWidth, StudentAuth studentAuth,isNew) {
  return Container(
    width: screenWidth * 0.9,
    child: TextFormField(
        onChanged: (value) {
         isNew?studentAuth.student_new_pass=value:studentAuth.student_pass = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return isNew?"Please enter the new password":"Please enter the password";
          } else if (value.length < 8) {
            return "Password length must be atleast 8 characters long";
          } else {
            return null;
          }
        },
        style: GoogleFonts.montserrat(color: colorpallete.primaryText),
        cursorColor: colorpallete.primaryText,
        decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.borderColor,
                  width: 1.0),
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.inactiveBorder,
                  width: 1.0),
            ),
            fillColor: Color(0xFF121516),
            hintText: isNew?'New Password':'Current Password',
            hintStyle: GoogleFonts.montserrat(
                color: Color(0xFF9FA2A5), fontSize: 12),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:isNew? (studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.inactiveBorder):colorpallete.inactiveBorder,
                  width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.borderColor,
                  width: 1.0),
            ),
            errorText: "")),
  );
}

//<-----------------Password Input Widget ENd------------------------>

//<-----------------Confirm Input Widget ------------------------>
Widget cpasswordField(BuildContext context,double screenWidth, StudentAuth studentAuth) {
  return Container(
    width: screenWidth * 0.9,
    child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: true,
        validator: (value) {
          if (value != studentAuth.student_new_pass || value!.isEmpty) {
            SchedulerBinding.instance!.addPostFrameCallback((duration) {
              studentAuth.incorrectCredentials(2);
            });

            return "Password not matched";
          } else {
            SchedulerBinding.instance!.addPostFrameCallback((duration) {
              studentAuth.correctCredentials(2);
            });

            return null;
          }
        },
        style: GoogleFonts.montserrat(color: colorpallete.primaryText),
        cursorColor: colorpallete.primaryText,
        decoration: new InputDecoration(

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.borderColor,
                  width: 1.0),
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.inactiveBorder,
                  width: 1.0),
            ),
            fillColor: Color(0xFF121516),
            hintText: 'Confirm Password',
            hintStyle: GoogleFonts.montserrat(
                color: Color(0xFF9FA2A5), fontSize: 12),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.inactiveBorder,
                  width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: studentAuth.showIconStep2
                      ? colorpallete.successColor
                      : colorpallete.borderColor,
                  width: 1.0),
            ),
            errorText: "")),
  );
}

//<-----------------Confirm Password Input Widget ENd------------------------>
