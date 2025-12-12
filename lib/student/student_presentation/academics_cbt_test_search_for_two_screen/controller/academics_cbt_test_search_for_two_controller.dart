import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_search_for_two_model.dart';

/// A controller class for the AcademicsCbtTestSearchForTwoScreen.
///
/// This class manages the state of the AcademicsCbtTestSearchForTwoScreen, including the
/// current academicsCbtTestSearchForTwoModelObj
class AcademicsCbtTestSearchForTwoController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsCbtTestSearchForTwoModel> academicsCbtTestSearchForTwoModelObj =
      AcademicsCbtTestSearchForTwoModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
