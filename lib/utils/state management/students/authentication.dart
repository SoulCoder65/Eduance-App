import 'dart:async';

import 'package:flutter/material.dart';

//Service
import '../../services/students/authenctication.dart';
//Helpers
import '../../helpers/snackbar.dart';

class StudentAuth with ChangeNotifier {
//  Objects
  bool isLoading = false;
  bool showIconStep1 = false;
  bool showIconStep2 = false;
  bool showIconStep3 = false;
  bool hidePass = true;
  bool isMale = true;
  String? student_email;
  String? student_phone;
  String? student_pass;
  String? student_gender = "Male";
  // String? student_dob;
  String? student_fname;
  String? student_lname;
  TextEditingController student_dob_controller = TextEditingController();

  String? otp_check;
  String? entered_otp;
  int start = 60;
  bool isOtpValid = true;
  late Timer timer;
  bool wait = true;
  String errorMessage = '';
  Color errorMessageColor = Colors.black;

  void updateStudentAuthState() async {
    notifyListeners();
  }

  void correctCredentials(int step) {
    if (step == 1) {
      showIconStep1 = true;
    } else if (step == 2) {
      showIconStep2 = true;
    } else {
      showIconStep3 = true;
    }
    updateStudentAuthState();
  }

  void incorrectCredentials(int step) {
    if (step == 1) {
      showIconStep1 = false;
    } else if (step == 2) {
      showIconStep2 = false;
    } else {
      showIconStep3 = false;
    }
    updateStudentAuthState();
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        timer.cancel();
        wait = false;
        updateStudentAuthState();
      } else {
        start--;
        updateStudentAuthState();
      }
    });
  }

  void passwordVisibility() {
    hidePass = !hidePass;
    updateStudentAuthState();
  }

  void updateStudentAuthLoaderState(bool status) async {
    isLoading = status;
    notifyListeners();
  }

//  Checking Email Exist
  Future<void> checkEmailExist() async {
    updateStudentAuthLoaderState(true);

    try {} catch (e) {
      print(e);
    }
  }

//  Verifying and Otp Student
  Future<void> verifyEmailOtp(BuildContext context, bool resend) async {
    try {
      updateStudentAuthLoaderState(true);
      StudentAuthDio().verify_email_otp(context, student_email).then((std) => {
            updateStudentAuthLoaderState(false),
            if (std != null)
              {
                if (std.statusCode == 202)
                  {
                    otp_check = std.data['otpcode'].toString(),
                    if (!resend)
                      {Navigator.pushNamed(context, '/otpscreen')}
                    else
                      {
                        start = 60,
                        wait = true,
                        startTimer(),
                        isOtpValid = true,
                        showSnack(context, "OTP resend on $student_email"),
                      }
                  }
                else if (std.statusCode == 200)
                  {
                    //  Failed to Send OTP
                    showSnack(context, "Failed to send to OTP.Try again later"),
                  }
              }
          });
    } catch (e) {
      print(e);
      updateStudentAuthLoaderState(false);
      // print(errorMessage);
    }
  }

//  Signup Student
  Future<void> signupStudent(BuildContext context) async {
    try {
      updateStudentAuthLoaderState(true);
      StudentAuthDio()
          .signup_student(
              context,
              student_email,
              student_phone,
              student_pass,
              student_fname,
              student_lname,
              student_gender,
              student_dob_controller.text)
          .then((std) => {
      updateStudentAuthLoaderState(false),

          if(std!=null)
              {
                if(std.statusCode==201)
                  {
                    Navigator.pushNamedAndRemoveUntil(context, "/success_signup", (route) => false)
                  }
              }

      });
    } catch (e) {
      updateStudentAuthLoaderState(false);

      print(e);
    }
  }
}
