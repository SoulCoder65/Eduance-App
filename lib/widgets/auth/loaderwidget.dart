import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Helpers
import '../../utils/state management/students/authentication.dart';
import '../../widgets/comman/progress_indicator.dart';


Widget loaderWidgetAuth(BuildContext context,double screenWidth,double screenHeight)
{
  return Consumer<StudentAuth>(
    builder: (context, value, child) {
      if (value.isLoading) {
        return progresssSpinner(screenWidth, screenHeight, true);
      } else {
        return SizedBox();
      }
    },
  );
}