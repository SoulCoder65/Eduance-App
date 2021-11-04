import 'package:flutter/material.dart';
import '../../utils/state management/students/authentication.dart';
import 'package:intl/intl.dart';
void selectDate(BuildContext context, StudentAuth studentAuth) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day), // Refer step 1
    firstDate: DateTime(1920),
    lastDate: DateTime(DateTime.now().year + 1),
  );
  if (picked != null) {
    studentAuth.student_dob_controller
      ..text = DateFormat('MMMM dd,yyyy').format(picked)
      ..selection = TextSelection.fromPosition(TextPosition(
          offset: studentAuth.student_dob_controller.text.length,
          affinity: TextAffinity.upstream));
    // studentAuth.student_dob = DateFormat('MMMM dd,yyyy').format(picked);
  }
}
