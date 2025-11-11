// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_ongoing_model.dart';

/// A controller class for the AcademicsCbtTestOngoingScreen.
///
/// This class manages the state of the AcademicsCbtTestOngoingScreen, including the
/// current academicsCbtTestOngoingModelObj
class AcademicsCbtTestOngoingController extends GetxController {
  Rx<AcademicsCbtTestOngoingModel> academicsCbtTestOngoingModelObj =
      AcademicsCbtTestOngoingModel().obs;

  Rx<String> whowasthe = "".obs;
}
