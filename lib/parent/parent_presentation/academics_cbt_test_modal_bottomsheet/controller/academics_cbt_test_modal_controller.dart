// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_modal_model.dart';

/// A controller class for the AcademicsCbtTestModalBottomsheet.
///
/// This class manages the state of the AcademicsCbtTestModalBottomsheet, including the
/// current academicsCbtTestModalModelObj
class AcademicsCbtTestModalController extends GetxController {
  Rx<AcademicsCbtTestModalModel> academicsCbtTestModalModelObj =
      AcademicsCbtTestModalModel().obs;
}
