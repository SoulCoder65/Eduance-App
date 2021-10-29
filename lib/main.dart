// @dart=2.9
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//<------------------------->
//<------------Routing------------->
import 'config/routes/routes.dart';
import 'config/routes/routes_config.dart';

//<----------Providers------------->
import 'utils/state management/students/authentication.dart';

//<----------Constants --------------->
import 'utils/constants/colors.dart';

void main()async {
  await WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setEnabledSystemUIOverlays([]);
  await dotenv.load(fileName: ".env");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => StudentAuth()),
    ],
      builder: (context, child) {
        return MyApp();
      }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Route Setting
  _MyAppState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    RouteConfig.router = router;
  }

  final colors = ColorPallete();
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
