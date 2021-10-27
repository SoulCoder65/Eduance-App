import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
//Widgets
import '../../../widgets/signup/steps.dart';
import '../../../widgets/signup/subtitle.dart';
import '../../../widgets/comman/backbtn.dart';
import '../../../widgets/comman/submitbtn.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/validatephone.dart';
class RegisterScreenTwo extends StatefulWidget {
  @override
  _RegisterScreenTwoState createState() => _RegisterScreenTwoState();
}

class _RegisterScreenTwoState extends State<RegisterScreenTwo> {
  var screenWidth;
  var screenHeight;

  bool showIcon = false;
  bool passwordVisible = true;

  final String text =
      "Please enter the necessary details to\ncontinue making your account.";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode f1 = new FocusNode();
  FocusNode f2 = new FocusNode();
  FocusNode f3 = new FocusNode();
  final colorpallete = ColorPallete();
  bool keyboardIsOpen=false;

  final TextEditingController _phoneVal = TextEditingController();
  final TextEditingController _passwordVal = TextEditingController();
  final TextEditingController _cpasswordVal = TextEditingController();

  void submitPasswordFun()
  {
    print("Hello");
    if (_formKey.currentState!.validate()) {
       Navigator.pushNamed(context, '/register3');
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
                          stepsWidget(context, screenWidth, "02"),
                          SizedBox(height: screenHeight * 0.01),
                          subtitleText(context, screenWidth, text),
                          Form(
                              key: _formKey,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  _phoneField(context, screenWidth),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _passwordField(context, screenWidth),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _cpasswordField(context, screenWidth),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  showIcon
                                      ? Container(
                                    width: screenWidth,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Feather.check_circle,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Password matched!",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.green),
                                        )
                                      ],
                                    ),
                                  )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 40,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      // _submitBtn(context, screenWidth),
                    ],
                  ),
                ),
              ),
              !keyboardIsOpen
                  ? Positioned(
                  bottom: 0,
                  left: 20,
                  child: submitBtn(context, screenWidth,"Continue",submitPasswordFun)
                      )
                  : SizedBox(),
            ],
          )),
    );
  }


  void correctPassword() {
    setState(() {
      showIcon = true;

    });
     }

  void incorrectPassword() {
    setState(() {
   showIcon=false;
    });
  }

//  <-----------------Widgets-------------------->
//<-----------------Mobile Input Widget ------------------------>
  Widget _phoneField(BuildContext context, double screenWidth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.only(top: screenHeight * 0.07),
        child: TextFormField(
            keyboardType: TextInputType.phone,
            focusNode: f1,
            onFieldSubmitted: (value) {
              f1.unfocus();
              FocusScope.of(context).requestFocus(f2);
            },
            controller: _phoneVal,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the Mobile number";
              } else if (!phoneValidate(value)) {
                return "Please enter correct Mobile number";
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
                hintText: 'Mobile number',
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

//<-----------------Mobile Input Widget ENd------------------------>

//<-----------------Password Input Widget ------------------------>
  Widget _passwordField(BuildContext context, double screenWidth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        child: TextFormField(
            obscureText: passwordVisible,
            focusNode: f2,
            onFieldSubmitted: (value) {
              f2.unfocus();
              FocusScope.of(context).requestFocus(f3);
            },
            controller: _passwordVal,
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the Password";
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
                  borderSide: BorderSide(color:showIcon?colorpallete.successColor:colorpallete.borderColor, width: 1.0),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: showIcon?colorpallete.successColor:colorpallete.inactiveBorder, width: 1.0),
                ),
                fillColor: Color(0xFF121516),
                hintText: 'Password',
                hintStyle: GoogleFonts.montserrat(
                    color: Color(0xFF9FA2A5), fontSize: 12),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: showIcon?colorpallete.successColor:colorpallete.inactiveBorder, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: showIcon?colorpallete.successColor:colorpallete.borderColor, width: 1.0),
                ),
                errorText: "")),
      ),
    );
  }

//<-----------------Password Input Widget ENd------------------------>

//<-----------------Confirm Input Widget ------------------------>
  Widget _cpasswordField(BuildContext context, double screenWidth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: passwordVisible,
            focusNode: f3,
            onFieldSubmitted: (value) {
              f3.unfocus();
            },
            controller: _cpasswordVal,
            validator: (value) {
              if (value != _passwordVal.text || value!.isEmpty) {
                SchedulerBinding.instance!.addPostFrameCallback((duration) {
                  incorrectPassword();
                });

                return "Password not matched";
              } else {
                SchedulerBinding.instance!.addPostFrameCallback((duration) {
                  correctPassword();
                });

                return null;
              }
            },
            style: GoogleFonts.montserrat(color: colorpallete.primaryText),
            cursorColor: colorpallete.primaryText,
            decoration: new InputDecoration(
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  child: Icon(
                    passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: colorpallete.primaryText,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:showIcon?colorpallete.successColor:colorpallete.borderColor, width: 1.0),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: showIcon?colorpallete.successColor:colorpallete.inactiveBorder, width: 1.0),
                ),
                fillColor: Color(0xFF121516),
                hintText: 'Confirm Password',
                hintStyle: GoogleFonts.montserrat(
                    color: Color(0xFF9FA2A5), fontSize: 12),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: showIcon?colorpallete.successColor:colorpallete.inactiveBorder, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: showIcon?colorpallete.successColor:colorpallete.borderColor, width: 1.0),
                ),
                errorText: "")),
      ),
    );
  }

//<-----------------Confirm Password Input Widget ENd------------------------>

//  <-----------------Widgets END-------------------->
}
