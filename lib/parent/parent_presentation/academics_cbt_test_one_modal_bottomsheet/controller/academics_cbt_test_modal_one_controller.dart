// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_modal_one_model.dart';

/// A controller class for the AcademicsCbtTestModalOneBottomsheet.
///
/// This class manages the state of the AcademicsCbtTestModalOneBottomsheet, including the
/// current academicsCbtTestModalOneModelObj
class AcademicsCbtTestModalOneController extends GetxController {
  Rx<AcademicsCbtTestModalOneModel> academicsCbtTestModalOneModelObj =
      AcademicsCbtTestModalOneModel().obs;
}
