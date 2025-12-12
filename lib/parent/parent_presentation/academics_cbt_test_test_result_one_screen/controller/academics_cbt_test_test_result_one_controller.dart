// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_test_result_one_model.dart';

/// A controller class for the AcademicsCbtTestTestResultOneScreen.
///
/// This class manages the state of the AcademicsCbtTestTestResultOneScreen, including the
/// current academicsCbtTestTestResultOneModelObj
class AcademicsCbtTestTestResultOneController extends GetxController {
  Rx<AcademicsCbtTestTestResultOneModel> academicsCbtTestTestResultOneModelObj =
      AcademicsCbtTestTestResultOneModel().obs;

  Rx<String> whowasthe = "".obs;

  Rx<String> inwhatyear = "".obs;
}
