// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_modal_two_model.dart';

/// A controller class for the AcademicsCbtTestModalTwoBottomsheet.
///
/// This class manages the state of the AcademicsCbtTestModalTwoBottomsheet, including the
/// current academicsCbtTestModalTwoModelObj
class AcademicsCbtTestModalTwoController extends GetxController {
  Rx<AcademicsCbtTestModalTwoModel> academicsCbtTestModalTwoModelObj =
      AcademicsCbtTestModalTwoModel().obs;
}
