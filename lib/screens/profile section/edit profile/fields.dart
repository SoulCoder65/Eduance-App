import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/select_date.dart';
import '../../../utils/state management/students/authentication.dart';
final colorpallete=ColorPallete();



Widget profile_fields(BuildContext context,double screenWidth)
{
  return Container(
    width: screenWidth,
    child: Consumer<StudentAuth>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            _fnameField(context, screenWidth,value),
            SizedBox(
              height: 10,
            ),
            _lnameField(context, screenWidth,value),
            SizedBox(
              height: 10,
            ),
            _dateField(context,screenWidth,value),
            SizedBox(
              height: 10,
            ),
            _genderWidget(context, screenWidth, value),

          ],
        );
      },
    )
  );
}

//<-----------------First name Input Widget ------------------------>
Widget _fnameField(BuildContext context, double screenWidth,StudentAuth studentAuth) {
  return Container(
    width: screenWidth * 0.9,
    child: TextFormField(
      initialValue: studentAuth.student_fname,
        onChanged: (value) {
          studentAuth.student_fname = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter the First name";
          } else {
            return null;
          }
        },
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
            hintText: 'Firstname',
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

//<-----------------Last name Input Widget ------------------------>
Widget _lnameField(BuildContext context, double screenWidth,StudentAuth studentAuth) {
  return Container(
    width: screenWidth * 0.9,
    child: TextFormField(
        onChanged: (value) {
          studentAuth.student_lname = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter the Last name";
          } else {
            return null;
          }
        },
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
            hintText: 'Lastname',
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

//<-----------------Last NameWidget ENd------------------------>
//<-----------------Date Input Widget ------------------------>
Widget _dateField(BuildContext context,double screenWidth, StudentAuth studentAuth) {
  return Container(
    width: screenWidth * 0.9,
    child: GestureDetector(
      onTap: () {
        selectDate(context, studentAuth);
      },
      child: Container(
        // padding: EdgeInsets.only(top: 10),
        child: AbsorbPointer(
          child: TextFormField(
              controller: studentAuth.student_dob_controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter the Birth Date";
                } else {
                  return null;
                }
              },
              style:
              GoogleFonts.montserrat(color: colorpallete.primaryText),
              cursorColor: colorpallete.primaryText,
              decoration: new InputDecoration(
                  hintStyle: GoogleFonts.montserrat(
                      color: Color(0xFF9FA2A5), fontSize: 12),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: colorpallete.primaryText,
                    ),
                    onPressed: () {},
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorpallete.borderColor, width: 1.0),
                  ),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: colorpallete.inactiveBorder, width: 1.0),
                  ),
                  fillColor: Color(0xFF121516),
                  hintText: 'Birth Date',
                  errorBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  errorText: "")),
        ),
      ),
    ),
  );
}

//<-----------------Date Widget ENd------------------------>
//<-----------------Gender Field---------------------->
Widget _genderWidget(BuildContext context,double screenWidth, StudentAuth studentAuth) {
  return Container(
    width: screenWidth * 0.9,
    // padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            studentAuth.student_gender = "Male";
            studentAuth.isMale = true;
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            width: screenWidth * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                studentAuth.isMale
                    ? Icon(Feather.check_circle, color: Colors.green)
                    : Icon(
                  Icons.circle,
                  color: colorpallete.btnTextColor,
                ),
                AutoSizeText(
                  "Male",
                  style: GoogleFonts.montserrat(
                      color: colorpallete.primaryText,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Color(0xFF121516),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: studentAuth.isMale
                        ? Colors.green
                        : Color(0xFF121516),
                    width: 2)),
          ),
        ),
        GestureDetector(
          onTap: () {
            studentAuth.student_gender = "Female";
            studentAuth.isMale = false;
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            width: screenWidth * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                !studentAuth.isMale
                    ? Icon(Feather.check_circle, color: Colors.green)
                    : Icon(
                  Icons.circle,
                  color: colorpallete.btnTextColor,
                ),
                AutoSizeText(
                  "Female",
                  style: GoogleFonts.montserrat(
                      color: colorpallete.primaryText,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Color(0xFF121516),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: !studentAuth.isMale
                        ? Colors.green
                        : Color(0xFF121516),
                    width: 2)),
          ),
        ),
      ],
    ),
  );
}
//<-----------------Gender Field END---------------------->
