import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _storage = FlutterSecureStorage();

//Saving user id for remember
Future<void> save_login_data(String? id) async {
  await _storage.write(key: "id", value: id);
}

//Check User Exist
Future<String?> check_user_already_login() async {
  String? value = await _storage.read(key: "id");

  return value;
}

//Logout user
Future<void> logout_user(BuildContext context)async{
  print("Balis");
  await _storage.delete(key: "id").then((value) => {
    Navigator.pushNamedAndRemoveUntil(context, "/userlogin", (route) => false)
  });
}
