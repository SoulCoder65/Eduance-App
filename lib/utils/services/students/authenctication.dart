import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../others/dio_client.dart';
//Services
import '../../services/others/exception.dart';

//Helpers
import '../../helpers/snackbar.dart';

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
}
