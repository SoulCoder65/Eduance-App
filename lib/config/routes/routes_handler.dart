
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//<--------Authentication----------------->
//Splash Screen
import '../../screens/splash/splashscreen.dart';
//Login
import '../../screens/authentication/login/login.dart';

//Signup
import '../../screens/authentication/signup/register_screen1.dart';
import '../../screens/authentication/signup/register_screen2.dart';
import '../../screens/authentication/signup/register_screen3.dart';
//Otp Screen
import '../../screens/authentication/signup/otp_verification.dart';
import '../../screens/authentication/signup/success_screen.dart';

//DashBoard
import '../../screens/dashboard/dashboard.dart';

//Profile Section
import '../../screens/profile section/profile/profile.dart';
import '../../screens/profile section/edit profile/edit_profile.dart';
import '../../screens/profile section/password/change_password.dart';
import '../../screens/profile section/contact/contactinfo.dart';

//Quiz Section
import '../../screens/quiz section/quiz_home.dart';
import '../../screens/quiz section/quiz_page.dart';
import '../../screens/quiz section/quiz_result.dart';


//Blog Section
import '../../screens/blog section/blog.dart';
import '../../screens/blog section/blog_read_page.dart';
// Root Handler
var rootHandler=Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> params){
  return SplashScreen();
});

//Authentication
//User UserLogin
var userloginHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return LoginScreen();
} );

//User Registration
var registrationOneHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return RegisterScreenOne();
} );
var registrationTwoHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return RegisterScreenTwo();
} );
var registrationThreeHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return RegisterScreenThree();
} );
var otpHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return OTPScreen();
} );
var successSignupHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return SuccessSignup();
} );

//Dash board
var dashboardHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return StudentDashBoard();
} );
//Profile Section
var profileHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return ProfileSection();
} );
var profileEditHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return EditProfile();
} );
var changePasswordHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return ChangePassword();
} );
var contactInformationHandler=Handler(handlerFunc:(BuildContext? context,Map<String,List<String>> params){
  return ContactInfo();
} );

//<-------------Quiz Section----------------->
var quizHomeHandler=Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> params){
  return QuizHome();
});
var quizPageHandler=Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> params){
  return QuizPage();
});
var quizResultHandler=Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> params){
  return QuizResult();
});


//<---------------Blog Section------------------------->
var blogHomeHandler=Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> params){
  return BlogHome();
});
var blogReadHandler=Handler(handlerFunc: (BuildContext? context,Map<String,List<String>> params){
  return BlogReadPage();
});
