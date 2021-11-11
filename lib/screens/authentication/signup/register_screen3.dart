// import 'package:app/Screens/Login_Otp%20Screens/otp_screen.dart';
// import 'package:app/Screens/Register%20Screen/loading_screen(register).dart';
// import 'package:email_auth/email_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//Widgets
import '../../../widgets/auth/steps.dart';
import '../../../widgets/auth/subtitle.dart';
import '../../../widgets/comman/backbtn.dart';
import '../../../widgets/comman/submitbtn.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../widgets/auth/loaderwidget.dart';
import '../../../utils/helpers/widget_functions/select_date.dart';
//Services
import '../../../utils/state management/students/authentication.dart';

class RegisterScreenThree extends StatefulWidget {
  @override
  _RegisterScreenThreeState createState() => _RegisterScreenThreeState();
}

class _RegisterScreenThreeState extends State<RegisterScreenThree> {
  var screenWidth;
  var screenHeight;
  Color borderColor = Colors.white;
  Color inactiveBorder = Colors.transparent;
  Color btnTextColor = Colors.white24;
  Color btnBgColor = Color(0xFF026584).withOpacity(0.3);

  final String text = "Last step, we want to know about you.";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode f1 = new FocusNode();
  FocusNode f2 = new FocusNode();
  FocusNode f3 = new FocusNode();
  final colorpallete = ColorPallete();

  bool keyboardIsOpen = false;

  void registerUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
       Provider.of<StudentAuth>(context, listen: false).signupStudent(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.black,
              ),
              Container(
                width: screenWidth,
                height: screenHeight,
                padding: const EdgeInsets.only(top: 25, left: 20),
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          backBtn(context, screenWidth),
                          SizedBox(height: screenHeight * 0.07),
                          stepsWidget(context, screenWidth, "04"),
                          SizedBox(height: screenHeight * 0.01),
                          subtitleText(context, screenWidth, text),
                          Form(
                              key: _formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Consumer<StudentAuth>(
                                builder: (context, value, child) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      _fnameField(context, value),
                                      SizedBox(
                                        height: 13,
                                      ),
                                      _lnameField(context, value),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      _dateField(context, value),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      _genderWidget(context, value),
                                    ],
                                  );
                                },
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              !keyboardIsOpen
                  ? Positioned(
                      bottom: 20,
                      left: 20,
                      child: submitBtn(
                          context, screenWidth, "Register", registerUser))
                  : SizedBox(),
              loaderWidgetAuth(context,screenWidth,screenHeight),
            ],
          )),
    );
  }

//  <-----------------Widgets---------------->

//<-----------------First name Input Widget ------------------------>
  Widget _fnameField(BuildContext context, StudentAuth studentAuth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        child: TextFormField(
            focusNode: f2,
            onFieldSubmitted: (value) {
              f2.unfocus();
              FocusScope.of(context).requestFocus(f3);
            },
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
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: inactiveBorder, width: 1.0),
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
      ),
    );
  }

//<-----------------Date Input Widget ENd------------------------>
  //<-----------------Date Input Widget ------------------------>
  Widget _dateField(BuildContext context, StudentAuth studentAuth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        child: GestureDetector(
          onTap: () {
            selectDate(context, studentAuth);
          },
          child: Container(
            padding: EdgeInsets.only(top: 10),
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
                        borderSide: BorderSide(color: borderColor, width: 1.0),
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: inactiveBorder, width: 1.0),
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
      ),
    );
  }

//<-----------------Date Widget ENd------------------------>

//<-----------------Last name Input Widget ------------------------>
  Widget _lnameField(BuildContext context, StudentAuth studentAuth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        child: TextFormField(
            focusNode: f3,
            onFieldSubmitted: (value) {
              f3.unfocus();
            },
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
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: inactiveBorder, width: 1.0),
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
      ),
    );
  }

//<-----------------Last Input Widget ENd------------------------>
//<-----------------Gender Field---------------------->
  Widget _genderWidget(BuildContext context, StudentAuth studentAuth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
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
      ),
    );
  }
//<-----------------Gender Field END---------------------->

//  <-----------------Widgets END---------------->
}
