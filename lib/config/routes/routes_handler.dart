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