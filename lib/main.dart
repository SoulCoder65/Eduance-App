// @dart=2.9
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
//<------------------------->
//<------------Routing------------->
import 'config/routes/routes.dart';
import 'config/routes/routes_config.dart';
//<----------Constants --------------->
import 'utils/constants/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Route Setting
  _MyAppState()
  {
    final router=FluroRouter();
    Routes.configureRoutes(router);
    RouteConfig.router=router;
  }

  final colors=ColorPallete();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: colors.bgColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splashscreen",
      onGenerateRoute: RouteConfig.router.generator,
    );
  }
}
