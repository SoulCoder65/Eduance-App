import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';

//Widgets
import '../../../widgets/signup/steps.dart';
import '../../../widgets/signup/subtitle.dart';
import '../../../widgets/signup/titletext.dart';
import '../../../widgets/comman/backbtn.dart';
import '../../../widgets/comman/submitbtn.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/validateemail.dart';
class RegisterScreenOne extends StatefulWidget {

  @override
  _RegisterScreenOneState createState() => _RegisterScreenOneState();
}

class _RegisterScreenOneState extends State<RegisterScreenOne> {
  var screenWidth;
  var screenHeight;
  bool showIcon = false;
  bool enableBtn = false;
  bool keyboardIsOpen=false;

  final String text =
      "Enter your email address to continue. We will\nsend you an OTP for verification.";
  GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  TextEditingController _emailval = TextEditingController();
  final colorpallete=ColorPallete();


  //Methods
  //Form Submit
  void submitEmailFun()
  {
    print("Hello");
    if (_emailFormKey.currentState!.validate()) {
       Navigator.pushNamed(context, '/userlogin');
    }

  }
  void correctEmail() {
    setState(() {
      showIcon = true;
      enableBtn = true;
    });
  }

  void incorrectEmail() {
    setState(() {
      showIcon = false;
      enableBtn = false;

    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body:Stack(children: [
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
                    stepsWidget(context, screenWidth, "01"),
                    SizedBox(height: screenHeight * 0.01),
                    subtitleText(context, screenWidth, text),
                    Form(
                        key: _emailFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: _emailField(screenWidth)),

                  ],
                )
            ),
            !keyboardIsOpen? Positioned(
                bottom: 0,
                left: 20,
                child:submitBtn(context, screenWidth,"Continue",submitEmailFun)
            ):SizedBox(),
          ],)
      ),
    );
  }

//  Widgets
//Email
//  Widgets
  Widget _emailField(double screenWidth) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.only(top: screenHeight * 0.07),
        child: TextFormField(
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              submitEmailFun();
            },
            controller: _emailval,
            validator: (value) {
              if (value!.isEmpty) {
                SchedulerBinding.instance!.addPostFrameCallback((duration) {
                   incorrectEmail();
                });
                return "Please enter the Email";
              } else if (!emailValidate(value)) {
                SchedulerBinding.instance!.addPostFrameCallback((duration) {
                   incorrectEmail();
                });

                return "Please enter correct Email";
              } else {
                SchedulerBinding.instance!.addPostFrameCallback((duration) {
                  correctEmail();
                });
                return null;
              }
            },
            style: GoogleFonts.montserrat(color: colorpallete.primaryText),
            cursorColor: colorpallete.primaryText,
            decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:colorpallete.borderColor, width: 1.0),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorpallete.inactiveBorder, width: 1.0),
                ),
                fillColor: Color(0xFF121516),
                suffixIcon: showIcon
                    ? Icon(Feather.check_circle, color: Colors.green)
                    : null,
                hintText: 'Email',
                hintStyle: GoogleFonts.montserrat(
                    color: Color(0xFF9FA2A5), fontSize: 12),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:showIcon?colorpallete.successColor:colorpallete.inactiveBorder, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:showIcon?colorpallete.successColor: colorpallete.borderColor, width: 1.0),
                ),
                errorText: "")),
      ),
    );
  }




}
