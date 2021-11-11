import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../others/dio_client.dart';
//Services
import '../../../services/others/exception.dart';

//Helpers
import '../../../helpers/widget_functions/snackbar.dart';

class StudentAuthDio {
  DioClient _dioClient = DioClient();
//  Verifying Email and sending otp

  verify_email_otp(BuildContext context, String? email) async {
    try {
      Response res = await _dioClient
          .post("/student/auth/check_email", data: {"email": email});
      print("res $res");
      return res;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      showSnack(context, errorMessage);
    }
  }

//  Signup Api
  signup_student(
      BuildContext context,
      String? email,
      String? phone,
      String? password,
      String? fname,
      String? lname,
      String? gender,
      String? dob) async {
    try {
      Response res = await _dioClient.post("/student/auth/signup", data: {
        "email": email,
        "phone": phone,
        "password": password,
        "fname": fname,
        "lname": lname,
        "gender": gender,
        "dob": dob,
      });
      return res;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      showSnack(context, errorMessage);
    }
  }

  //  Signin Api
  signin_student(
    BuildContext context,
    String? email,
    String? password,
  ) async {
    try {
      Response res = await _dioClient.post("/student/auth/signin", data: {
        "email": email,
        "password": password,
      });
      print("res ${res}");
      return res;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      showSnack(context, errorMessage);
    }
  }

  //  Check User Already Signin
  fetch_profile_student(BuildContext context, String? id) async {
    try {
      Response res =
          await _dioClient.post("/student/profile/fetchprofile", data: {
        "_id": id,
      });
      return res;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      showSnack(context, errorMessage);

      Timer(
          Duration(seconds: 2),
          (() => {
                exit(0),
              }));
    }
  }

//  Update user profile
  update_user_profile(BuildContext context, String? id, String? fname,
      String? lname, String? dob, String? gender, String? profileurl) async {
    try{
      Response res =
      await _dioClient.post("/student/profile/updateprofile", data: {
        "_id": id,
        "fname":fname,
        "lname":lname,
        "dob":dob,
        "gender":gender,
        "profileurl":profileurl
      });
      return res;

    } on DioError catch(e)
    {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      showSnack(context, errorMessage);

    }
  }


//  Update user password
  update_user_password(BuildContext context, String? id, String? oldpass,
      String? newpass
      ) async {
    try{
      Response res =
      await _dioClient.post("/student/profile/updatepassword", data: {
        "_id": id,
        "password":oldpass,
        "newpassword":newpass,
        });

      return res;

    } on DioError catch(e)
    {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(errorMessage);
      showSnack(context, errorMessage);

    }
  }
}
