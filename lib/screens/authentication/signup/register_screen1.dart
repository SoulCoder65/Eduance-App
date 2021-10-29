import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
//Widgets
import '../../../widgets/auth/steps.dart';
import '../../../widgets/auth/subtitle.dart';
import '../../../widgets/auth/titletext.dart';
import '../../../widgets/comman/backbtn.dart';
import '../../../widgets/comman/submitbtn.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/validateemail.dart';
import '../../../widgets/auth/loaderwidget.dart';
//Services
import '../../../utils/state management/students/authentication.dart';
class RegisterScreenOne extends StatefulWidget {

  @override
  _RegisterScreenOneState createState() => _RegisterScreenOneState();
}

class _RegisterScreenOneState extends State<RegisterScreenOne> {
  var screenWidth;
  var screenHeight;
  bool keyboardIsOpen=false;

  final String text =
      "Enter your email address to continue. We will\nsend you an OTP for verification.";
  GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final colorpallete=ColorPallete();


  //Methods
  //Form Submit
  void submitEmailFun()
  {
    if (_emailFormKey.currentState!.validate()) {
      Provider.of<StudentAuth>(context,listen: false).verifyEmailOtp(context,false);
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
          body:Stack(children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: colorpallete.bgColor,
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
                bottom:20,
                left: 20,
                child:submitBtn(context, screenWidth,"Continue",submitEmailFun)
            ):SizedBox(),
            loaderWidgetAuth(context,screenWidth,screenHeight),

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
        child: Consumer<StudentAuth>(builder: (context, value, child) {
          return TextFormField(
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (email) {
                value.student_email=email;
                FocusManager.instance.primaryFocus!.unfocus();

                submitEmailFun();
              },
              validator: (val) {
                if (val!.isEmpty) {
                  SchedulerBinding.instance!.addPostFrameCallback((duration) {
                   value.incorrectCredentials(1);
                  });
                  return "Please enter the Email";
                } else if (!emailValidate(val)) {
                  SchedulerBinding.instance!.addPostFrameCallback((duration) {
                    value.incorrectCredentials(1);
                  });

                  return "Please enter correct Email";
                } else {
                  SchedulerBinding.instance!.addPostFrameCallback((duration) {
                    value.correctCredentials(1);
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
                  suffixIcon: value.showIconStep1
                      ? Icon(Feather.check_circle, color: Colors.green)
                      : null,
                  hintText: 'Email',
                  hintStyle: GoogleFonts.montserrat(
                      color: Color(0xFF9FA2A5), fontSize: 12),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:value.showIconStep1?colorpallete.successColor:colorpallete.inactiveBorder, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:value.showIconStep1?colorpallete.successColor: colorpallete.borderColor, width: 1.0),
                  ),
                  errorText: ""));
        },),
      ),
    );
  }




}
