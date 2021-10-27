// import 'package:app/Screens/Login_Otp%20Screens/otp_screen.dart';
// import 'package:app/Screens/Register%20Screen/loading_screen(register).dart';
// import 'package:email_auth/email_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
//Widgets
import '../../../widgets/signup/steps.dart';
import '../../../widgets/signup/subtitle.dart';
import '../../../widgets/comman/backbtn.dart';
import '../../../widgets/comman/submitbtn.dart';
//Helpers
import '../../../utils/constants/colors.dart';


class RegisterScreenThree extends StatefulWidget {
  @override
  _RegisterScreenThreeState createState() => _RegisterScreenThreeState();
}

class _RegisterScreenThreeState extends State<RegisterScreenThree> {
  var screenWidth;
  var screenHeight;
  bool showIcon = false;
  bool enableBtn = false;
  bool passwordVisible = true;
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

  final TextEditingController _username = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  bool keyboardIsOpen=false;
  TextEditingController selectedDateVal =
  TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isMale=true;

  void registerUser()
  {
    if (_formKey.currentState!.validate()) {
      // Navigator.pushNamed(context, '/register_step_2');
    }

  }
  void correctuserName() {
    setState(() {
      borderColor = Colors.green;
      inactiveBorder = Colors.green;
      showIcon = true;
      btnTextColor = colorpallete.primaryText;
      btnBgColor = Color(0xFF026584);
    });
  }
  void updateDate(DateTime date) {
    setState(() {
      selectedDate = date;
      selectedDateVal
        ..text = DateFormat('MMMM dd,yyyy').format(date)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: selectedDateVal.text.length,
            affinity: TextAffinity.upstream));
    });
  }
  //Update gender Status
  void updateGender(bool val)
  {
    setState(() {
      isMale=val;
    });
  }
  // <-------------------------SELECT DATE FOR Booking---------------------------->
  _selectDate(
      BuildContext context, Function updateDate, DateTime selectedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day), // Refer step 1
      firstDate: DateTime(1920),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != selectedDate) {
      updateDate(picked);
    }
  }
  void sendOTP(String email) async {
    // EmailAuth.sessionName = "OTP Request";
    // var res = await EmailAuth.sendOtp(receiverMail: email);
    // if (res) {
    // } else {}
  }


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    // orientation = MediaQuery.of(context).orientation;
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
                          stepsWidget(context, screenWidth, "03"),
                          SizedBox(height: screenHeight * 0.01),
                          subtitleText(context, screenWidth, text),
                          Form(
                              key: _formKey,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _fnameField(context, screenWidth),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _lnameField(context, screenWidth),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                   _dateField(context,screenWidth,updateDate,selectedDate,selectedDateVal),
                                SizedBox(height: 20,),
                                  _genderWidget(context,screenWidth,isMale,updateGender),

                                ],
                              )),
                        ],
                      ),

                     ],
                  ),
                ),
              ),
              !keyboardIsOpen
                  ? Positioned(
                  bottom: 0,
                  left: 20,
                  child: submitBtn(context, screenWidth,"Register",registerUser)
                      )
                  : SizedBox(),
            ],
          )),
    );
  }

//  <-----------------Widgets---------------->

//<-----------------First name Input Widget ------------------------>
  Widget _fnameField(BuildContext context, double screenWidth) {
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
            controller: _fname,
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
  Widget _dateField(BuildContext context, double screenWidth, Function updateDate,
      DateTime selectedDate, TextEditingController selectedDateVal) {
    return Align(
      alignment: Alignment.topLeft,

      child: Container(
        width: screenWidth * 0.9,

        child: GestureDetector(
          onTap: () {
             _selectDate(context, updateDate, selectedDate);
          },
          child: Container(

            padding: EdgeInsets.only(top: 10),
            child: AbsorbPointer(
              child: TextFormField(
                  controller: selectedDateVal,

                  validator: ( value) {
                    if (value!.isEmpty) {
                      return "Please enter the Birth Date";
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.montserrat(color: colorpallete.primaryText),
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
                        borderSide: BorderSide(color: inactiveBorder, width: 1.0),
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
  Widget _lnameField(BuildContext context, double screenWidth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        child: TextFormField(
            focusNode: f3,
            onFieldSubmitted: (value) {
              f3.unfocus();
            },
            controller: _lname,
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
  Widget _genderWidget(BuildContext context, double screenWidth, bool isMale,
      Function updateGender) {
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
                updateGender(true);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                width: screenWidth * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    isMale
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
                        color: isMale ? Colors.green : Color(0xFF121516),
                        width: 2)),
              ),
            ),
            GestureDetector(
              onTap: () {
                updateGender(false);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                width: screenWidth * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    !isMale
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
                        color: !isMale ? Colors.green : Color(0xFF121516),
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
