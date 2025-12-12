// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_test_result_two_model.dart';

/// A controller class for the AcademicsCbtTestTestResultTwoScreen.
///
/// This class manages the state of the AcademicsCbtTestTestResultTwoScreen, including the
/// current academicsCbtTestTestResultTwoModelObj
class AcademicsCbtTestTestResultTwoController extends GetxController {
  Rx<AcademicsCbtTestTestResultTwoModel> academicsCbtTestTestResultTwoModelObj =
      AcademicsCbtTestTestResultTwoModel().obs;

  Rx<String> whowasthe = "".obs;

  Rx<String> inwhatyear = "".obs;
}
