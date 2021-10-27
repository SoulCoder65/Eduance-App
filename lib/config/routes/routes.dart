import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

//Router handler
import 'routes_handler.dart';

class Routes {
  //Names
  static String root = "/splashscreen";
  static String userlogin = "/userlogin";
  static String register1="/register1";
  static String register2="/register2";
  static String register3="/register3";
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("Route Not found");
      return;
    });
    router.define(root,handler: rootHandler);
    router.define(userlogin, handler: userloginHandler);
    router.define(register1, handler: registrationOneHandler);
    router.define(register2, handler: registrationTwoHandler);
    router.define(register3, handler: registrationThreeHandler);
  }
}
