import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Helpers
import '../../../utils/constants/colors.dart';
import '../../../utils/state management/students/authentication.dart';
//Components
import '../../../widgets/comman/backbtn.dart';
import 'fields.dart';
import '../../../widgets/comman/submitbtn.dart';
import '../../../widgets/auth/loaderwidget.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var screenWidth;
  var screenHeight;
  bool keyboardIsOpen = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  ColorPallete colorPallete = ColorPallete();

  void updatePasswordInfo(BuildContext context) {
    if(_formkey.currentState!.validate())
      {
      print(Provider.of<StudentAuth>(context,listen: false).student_pass);
      print(Provider.of<StudentAuth>(context,listen: false).student_new_pass);
      Provider.of<StudentAuth>(context,listen: false).updatePassword(context);
      }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            color: colorPallete.bgColor,
          ),
          Container(
              width: screenWidth,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(child: Consumer<StudentAuth>(
                builder: (context, value, child) {
                  return Form(
                    key: _formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        backBtn(context, screenWidth, true, "Change Password"),
                        SizedBox(
                          height: 80,
                        ),
                        passwordField(context, screenWidth, value, false),
                        SizedBox(
                          height: 20,
                        ),
                        passwordField(context, screenWidth, value, true),
                        SizedBox(
                          height: 20,
                        ),
                        cpasswordField(context, screenWidth, value)
                      ],
                    ),
                  );
                },
              ))),
          !keyboardIsOpen? Positioned(
              bottom:20,
              left: 20,
              child:submitBtn(context, screenWidth,"Save Changes",updatePasswordInfo)
          ):SizedBox(),
          loaderWidgetAuth(context,screenWidth,screenHeight),

        ],
      ),
    ));
  }
}
