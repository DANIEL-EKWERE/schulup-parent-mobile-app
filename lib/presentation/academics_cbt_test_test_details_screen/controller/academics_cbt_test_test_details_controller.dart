// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_test_details_model.dart';

/// A controller class for the AcademicsCbtTestTestDetailsScreen.
///
/// This class manages the state of the AcademicsCbtTestTestDetailsScreen, including the
/// current academicsCbtTestTestDetailsModelObj
class AcademicsCbtTestTestDetailsController extends GetxController {
  Rx<AcademicsCbtTestTestDetailsModel> academicsCbtTestTestDetailsModelObj =
      AcademicsCbtTestTestDetailsModel().obs;
}
