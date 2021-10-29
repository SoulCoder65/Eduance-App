import 'dart:async';

import 'package:flutter/material.dart';

Future<void> navigateFun(BuildContext context) async {
  Timer(Duration(seconds: 2),
      (() => {Navigator.pushReplacementNamed(context, "/register1")}));
}
