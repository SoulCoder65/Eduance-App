// import 'package:app/Screens/Profile/Change%20Password/change_password.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants/colors.dart';

final colorpallete = ColorPallete();
Widget userDetails(BuildContext context, double screenWidth) {
  return Container(
    width: screenWidth,
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        _birthGenderWidget(screenWidth),
        SizedBox(
          height: 25,
        ),
        _accountSet(context, screenWidth),
        SizedBox(
          height: 25,
        ),
        _securitySet(context, screenWidth),
      ],
    ),
  );
}

//birth gender widget
Widget _birthGenderWidget(double screenWidth) {
  return Container(
    width: screenWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorpallete.fieldColor,
          ),
          width: screenWidth * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Birthdate",
                style: GoogleFonts.montserrat(
                    color: colorpallete.widgetTextColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              AutoSizeText(
                "30 November, 1999",
                style: GoogleFonts.montserrat(
                    color: colorpallete.primaryText,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorpallete.fieldColor,
          ),
          width: screenWidth * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Gender",
                style: GoogleFonts.montserrat(
                    color: colorpallete.widgetTextColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              AutoSizeText(
                "Male",
                style: GoogleFonts.montserrat(
                    color: colorpallete.primaryText,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    ),
  );
}

//Account Setting
Widget _accountSet(BuildContext context, double screenWidth) {
  return Container(
    width: screenWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Account settings",
          style: GoogleFonts.montserrat(
              color: colorpallete.widgetTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/edit_profile');
          },
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorpallete.fieldColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Personal details",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: colorpallete.primaryText,
                      fontSize: 14),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: colorpallete.primaryText,
                  size: 14,
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

//Security Setting
Widget _securitySet(BuildContext context, double screenWidth) {
  return Container(
    width: screenWidth,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Security",
          style: GoogleFonts.montserrat(
              color: colorpallete.widgetTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
          Navigator.pushNamed(context, "/change_password");
            },
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorpallete.fieldColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Change password",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: colorpallete.primaryText,
                      fontSize: 14),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: colorpallete.primaryText,
                  size: 14,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/contact_info');
          },
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF121516),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Contact Information",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      color: colorpallete.primaryText,
                      fontSize: 14),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: colorpallete.primaryText,
                  size: 14,
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}


