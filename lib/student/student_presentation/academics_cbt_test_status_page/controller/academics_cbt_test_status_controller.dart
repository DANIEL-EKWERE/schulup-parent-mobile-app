// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_status_model.dart';

/// A controller class for the AcademicsCbtTestStatusPage.
///
/// This class manages the state of the AcademicsCbtTestStatusPage, including the
/// current academicsCbtTestStatusModelObj
class AcademicsCbtTestStatusController extends GetxController {
  AcademicsCbtTestStatusController(this.academicsCbtTestStatusModelObj);

  Rx<AcademicsCbtTestStatusModel> academicsCbtTestStatusModelObj;
}
