import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/state management/students/authentication.dart';
import '../../utils/helpers/others/save_and_check_login.dart';
Future<void> navigateFun(BuildContext context) async {

  String? value=await check_user_already_login();
  if(value!=null)
    {
      Provider.of<StudentAuth>(context,listen: false).fetchStudent(context, value);
    }
  else{
    Timer(Duration(seconds: 2),
        (() => {Navigator.pushReplacementNamed(context, "/userlogin")}));
  }


}
