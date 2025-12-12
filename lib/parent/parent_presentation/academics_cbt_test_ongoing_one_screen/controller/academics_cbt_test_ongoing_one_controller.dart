// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_ongoing_one_model.dart';

/// A controller class for the AcademicsCbtTestOngoingOneScreen.
///
/// This class manages the state of the AcademicsCbtTestOngoingOneScreen, including the
/// current academicsCbtTestOngoingOneModelObj
class AcademicsCbtTestOngoingOneController extends GetxController {
  Rx<AcademicsCbtTestOngoingOneModel> academicsCbtTestOngoingOneModelObj =
      AcademicsCbtTestOngoingOneModel().obs;

  Rx<String> whowasthe = "".obs;
}
