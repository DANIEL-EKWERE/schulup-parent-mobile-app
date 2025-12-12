// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_ongoing_two_model.dart';

/// A controller class for the AcademicsCbtTestOngoingTwoScreen.
///
/// This class manages the state of the AcademicsCbtTestOngoingTwoScreen, including the
/// current academicsCbtTestOngoingTwoModelObj
class AcademicsCbtTestOngoingTwoController extends GetxController {
  Rx<AcademicsCbtTestOngoingTwoModel> academicsCbtTestOngoingTwoModelObj =
      AcademicsCbtTestOngoingTwoModel().obs;

  Rx<String> inwhatyear = "".obs;
}
