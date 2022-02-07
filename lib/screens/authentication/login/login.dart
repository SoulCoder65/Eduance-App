import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/validators/validateemail.dart';
import '../../../widgets/auth/loaderwidget.dart';
//Services
import '../../../utils/state management/students/authentication.dart';

//Widgets
import 'header.dart';

import '../../../widgets/comman/submitbtn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var screenWidth;
  var screenHeight;
  final colorpallete = ColorPallete();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final colorPallete = ColorPallete();
  FocusNode f1 = new FocusNode();
  FocusNode f2 = new FocusNode();
  FocusNode f3 = new FocusNode();

  //Methods
  void signinFunction(BuildContext context) {
    Navigator.pushNamed(context, "blog_home");
    // if (_formKey.currentState!.validate()) {
    //   FocusManager.instance.primaryFocus!.unfocus();
    //
    //   print(Provider.of<StudentAuth>(context, listen: false).student_email);
    //   print(Provider.of<StudentAuth>(context, listen: false).student_pass);
    //   Provider.of<StudentAuth>(context, listen: false).signinStudent(context);
    // }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorpallete.bgColor,
      key: _scaffoldKey,
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
            child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: colorpallete.bgColor,
            ),
            Container(
              width: screenWidth,
              height: screenHeight,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: withEmailPassword(),
                    ),
                  ],
                ),
              ),
            ),
            loaderWidgetAuth(context, screenWidth, screenHeight),
          ],
        ));
      }),
    );
  }

  Widget withEmailPassword() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headerWidget(screenWidth),
            // ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            SizedBox(
              height: 10,
            ),
            _emailWidget(),

            SizedBox(
              height: screenHeight * 0.04,
            ),
            _passwordWidget(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            _forgetWidget(),
            submitBtn(context, screenWidth, "Login", signinFunction),
            _continueWidget(),
            _googleBtnWidget(),
            SizedBox(height: screenHeight * 0.02),
            _dontaccountWidget(),
          ],
        ),
      ),
    );
  }

//  <------------Email Field----------------->
  Widget _emailWidget() {
    return Container(
        width: screenWidth * 0.9,
        child: Consumer<StudentAuth>(
          builder: (context, value, child) {
            return TextFormField(
              focusNode: f1,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                height: 1,
                color: colorpallete.textFieldColor,
              ),
              cursorColor: colorpallete.primaryText,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 26, horizontal: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 1.0,
                      color: colorpallete.inactiveBorder,
                    ),
                  ),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorpallete.inactiveBorder, width: 1.0),
                  ),
                  fillColor: Color(0xFF121516),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorpallete.inactiveBorder, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorpallete.borderColor, width: 1.0),
                  ),
                  hintText: 'Email',
                  hintStyle: GoogleFonts.lato(
                    color: Color.fromRGBO(159, 162, 165, 1),
                    fontSize: 12,
                  ),
                  errorText: ""),
              onChanged: (email) {
                value.student_email = email;
              },
              onFieldSubmitted: (email) {
                f1.unfocus();
                FocusScope.of(context).requestFocus(f2);
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
              textInputAction: TextInputAction.next,
            );
          },
        ));
  }
//  <------------Email Field End----------------->

//  <------------Password Field----------------->
  Widget _passwordWidget() {
    return SizedBox(
        width: screenWidth * 0.9,
        child: Consumer<StudentAuth>(
          builder: (context, value, child) {
            return TextFormField(
              focusNode: f2,
              style: GoogleFonts.montserrat(
                height: 1,
                fontSize: 14,
                color: colorpallete.textFieldColor,
              ),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 25, horizontal: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: colorpallete.borderColor,
                  ),
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: colorpallete.inactiveBorder, width: 1.0),
                ),
                fillColor: Color(0xFF121516),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: colorpallete.inactiveBorder, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorpallete.borderColor, width: 1.0),
                ),
                hintText: 'Password',
                hintStyle: GoogleFonts.lato(
                  color: Color.fromRGBO(159, 162, 165, 1),
                  fontSize: 12,
                ),
              ),
              onChanged: (password) {
                value.student_pass = password;
              },
              onFieldSubmitted: (password) {
                f2.unfocus();
                FocusScope.of(context).requestFocus(f3);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter the Password";
                } else if (value.length < 8) {
                  return "Password length must be atleast 8 characters long";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
            );
          },
        ));
  }

//  <------------Password Field End----------------->
//  <------------Forget Password Field ----------------->
  Widget _forgetWidget() {
    return Container(
      width: screenWidth * 0.9,
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.lato(
              fontSize: 12,
              color: colorpallete.secondaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

//  <------------Forget Password Field End----------------->
//<-----------Continue Widget-------------->
  Widget _continueWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            thickness: 0.8,
            indent: 5.0,
            endIndent: 20.0,
            color: colorpallete.btnTextColor,
          )),
          Text(
            'or continue with',
            style: TextStyle(
                color: Color.fromRGBO(159, 162, 165, 1),
                fontSize: 12.0,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
              child: Divider(
            thickness: 0.8,
            indent: 10.0,
            endIndent: 20.0,
            color: colorpallete.btnTextColor,
          )),
        ],
      ),
    );
  }
//<-----------Continue Widget END-------------->

//<----------------Google Button--------------->
  Widget _googleBtnWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, bottom: 10),
        child: SizedBox(
          width: screenWidth * 0.9,
          height: 65,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      FlutterIcons.google_faw5d,
                      color: colorpallete.primaryText,
                    ),
                    onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Continue with google',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: colorpallete.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () async {},
            style: ElevatedButton.styleFrom(
              elevation: 2,
              primary: colorpallete.btnTextColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
//<----------------Google Button END--------------->

//<----------------Dont Account --------------->
  Widget _dontaccountWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Don’t have an account?',
            style: GoogleFonts.lato(
              fontSize: 12,
              color: Color.fromRGBO(159, 162, 165, 1),
              fontWeight: FontWeight.w900,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register1');
            },
            child: Text(
              'Register here',
              style: GoogleFonts.lato(
                fontSize: 12,
                color: colorpallete.logoColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
//<----------------Dont Account END--------------->

}
