import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
//Widgets
import '../../../widgets/auth/steps.dart';
import '../../../widgets/auth/titletext.dart';
import '../../../widgets/comman/backbtn.dart';
import '../../../widgets/comman/submitbtn.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../widgets/auth/loaderwidget.dart';
import '../../../utils/state management/students/authentication.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late double screenWidth;
  late double screenHeight;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final colorPallete = ColorPallete();
  final String text = 'Please enter the 6-digit OTP code that was sent to ';

  @override
  void initState() {
    super.initState();
    // Provider.of<StudentAuth>(context, listen: false).wait = false;
    Provider.of<StudentAuth>(context, listen: false).startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void sendOTP() async {
    Provider.of<StudentAuth>(context, listen: false)
        .verifyEmailOtp(context, true);
  }

  void verifyOTP() async {
    print(_otpController.text);
    if (_otpController.text !=
        Provider.of<StudentAuth>(context, listen: false).otp_check) {
      Provider.of<StudentAuth>(context, listen: false).isOtpValid = false;
      Provider.of<StudentAuth>(context, listen: false).updateStudentAuthState();
    } else {
      Provider.of<StudentAuth>(context, listen: false).isOtpValid = true;
      Provider.of<StudentAuth>(context, listen: false).updateStudentAuthState();
      Navigator.pushReplacementNamed(context, "/register2");
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    backBtn(context, screenWidth),
                    SizedBox(height: screenHeight * 0.07),
                    titleText(context, screenWidth),
                    SizedBox(height: screenHeight * 0.07),
                    stepsWidget(context, screenWidth, "02"),
                    SizedBox(height: screenHeight * 0.01),
                    Consumer<StudentAuth>(
                      builder: (context, value, child) {
                        return Container(
                            width: screenWidth,
                            child: RichText(
                              text: TextSpan(
                                  text: text,
                                  style: GoogleFonts.montserrat(),
                                  children: [
                                    TextSpan(
                                        text: value.student_email,
                                        style: GoogleFonts.montserrat(
                                            color: colorPallete.primaryText,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    otpWidget()
                  ],
                )),
            Positioned(
              bottom: 20,
              left: 20,
              child: submitBtn(context, screenWidth, "Verify", verifyOTP),
            ),
            loaderWidgetAuth(context, screenWidth, screenHeight),
          ],
        ));
  }

  Widget otpWidget() {
    return Form(
      key: _formKey,

      child: Consumer<StudentAuth>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // aspectRatio: 2.2,

              PinCodeTextField(
                controller: _otpController,
                autoFocus: true,
                textStyle: TextStyle(
                    color: value.isOtpValid
                        ? colorPallete.primaryText
                        : colorPallete.errorColor),
                hintCharacter: '.',
                appContext: context,

                length: 6,
                enablePinAutofill: false,
                obscureText: false,
                pinTheme: PinTheme(
                    activeColor: value.isOtpValid
                        ? colorPallete.primaryText
                        : colorPallete.errorColor,
                    selectedColor: value.isOtpValid
                        ? colorPallete.primaryText
                        : colorPallete.errorColor,
                    inactiveColor: value.isOtpValid
                        ? colorPallete.secondaryText
                        : colorPallete.errorColor,
                    fieldWidth: screenWidth / 8),
                keyboardType: TextInputType.number,
                onChanged: (result) {
                  value.entered_otp = result;
                },
                // onTap: () => reset(),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              !value.isOtpValid
                  ? Text(
                      "Invalid OTP",
                      style: TextStyle(
                        color: colorPallete.errorColor,
                        fontSize: 12.0,
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              InkWell(
                onTap: value.wait
                    ? null
                    : () {
                        _otpController.clear();

                        sendOTP();
                      },
                child: Container(
                  height: 100,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${value.wait ? "Resend OTP in " : "Resend OTP"} ',
                          style: GoogleFonts.lato(
                            color: value.wait ? Colors.grey : Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: value.wait ? value.start.toString() : "",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }


}
