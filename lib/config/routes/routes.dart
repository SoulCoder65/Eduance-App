import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

//Router handler
import 'routes_handler.dart';

class Routes {

  static TransitionType _transitionType=TransitionType.material;
  //Names
  static String root = "/splashscreen";
  static String userlogin = "/userlogin";
  static String register1="/register1";
  static String register2="/register2";
  static String register3="/register3";
  static String otp_screen="/otpscreen";
  static String success_signup="/success_signup";
  static String dash_board="/student_dashboard";
  static String profile="/profile";
  static String editprofile="/edit_profile";
  static String changepassword="/change_password";
  static String contactinfo="/contact_info";
  static String quizhome="/quiz_home";
  static String quizpage="/quiz_page";
  static String quizresult="/quiz_result";
  static String bloghome="/blog_home";
  static String blogread="/blog_read";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("Route Not found");
      return;
    });
    router.define(root,handler: rootHandler);
    router.define(userlogin, handler: userloginHandler,transitionType: _transitionType);
    router.define(register1, handler: registrationOneHandler,transitionType: _transitionType);
    router.define(register2, handler: registrationTwoHandler,transitionType: _transitionType);
    router.define(register3, handler: registrationThreeHandler,transitionType: _transitionType);
    router.define(otp_screen, handler: otpHandler,transitionType: _transitionType);
    router.define(success_signup, handler: successSignupHandler,transitionType: _transitionType);
    router.define(dash_board, handler: dashboardHandler,transitionType: _transitionType);
    router.define(profile, handler: profileHandler,transitionType: _transitionType);
    router.define(editprofile, handler: profileEditHandler,transitionType: _transitionType);
    router.define(changepassword, handler: changePasswordHandler,transitionType: _transitionType);
    router.define(contactinfo, handler: contactInformationHandler,transitionType: _transitionType);
  //  Quiz
    router.define(quizhome, handler: quizHomeHandler,transitionType: _transitionType);
    router.define(quizpage, handler: quizPageHandler,transitionType: _transitionType);
    router.define(quizresult, handler: quizResultHandler,transitionType: _transitionType);

    //<---------------Blog Section------------------>
    router.define(bloghome, handler: blogHomeHandler,transitionType: _transitionType);
    router.define(blogread, handler: blogReadHandler,transitionType: _transitionType);
  }
}
