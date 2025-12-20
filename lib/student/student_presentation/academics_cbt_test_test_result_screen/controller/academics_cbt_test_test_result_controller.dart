// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_test_result_model.dart';

/// A controller class for the AcademicsCbtTestTestResultScreen.
///
/// This class manages the state of the AcademicsCbtTestTestResultScreen, including the
/// current academicsCbtTestTestResultModelObj
class StudentAcademicsCbtTestTestResultController extends GetxController {
  Rx<StudentAcademicsCbtTestTestResultModel> academicsCbtTestTestResultModelObj =
      StudentAcademicsCbtTestTestResultModel().obs;

  Rx<String> whowasthe = "".obs;

  Rx<String> inwhatyear = "".obs;
}
