import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
//Widgets
import '../../../widgets/comman/submitbtn.dart';
//Helpers
import '../../../utils/constants/colors.dart';

class SuccessSignup extends StatefulWidget {
  @override
  _SuccessSignupState createState() => _SuccessSignupState();
}

class _SuccessSignupState extends State<SuccessSignup> {
  var screenWidth;
  var screenHeight;
  final colorpallete = ColorPallete();

  void redirectToLogin(BuildContext context)
  {
Navigator.pushNamedAndRemoveUntil(context, "/userlogin", (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: colorpallete.bgColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight! / 7),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("assets/animation/success_tick.json",
                      repeat: false),
                  SizedBox(
                    height: screenHeight! * 0.07,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('You\'re all set.',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20.0)),
                  ),
                  SizedBox(
                    height: screenHeight! * 0.04,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Your account has been ',
                              style: GoogleFonts.lato(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                                letterSpacing: 0.5,
                              ),
                            ),
                            TextSpan(
                              text: "successfully created.",
                              style: GoogleFonts.lato(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight! * 0.20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom:20,
              left: 20,
              child:submitBtn(context, screenWidth,"Continue",redirectToLogin)
          )
        ],
      ),
    );
  }
}
