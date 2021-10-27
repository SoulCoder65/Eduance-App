import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget spinner(BuildContext context, double size, Color color) {
  return SpinKitCircle(
    color: color,
    size: size,
  );
}
