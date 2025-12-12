// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_search_for_model.dart';

/// A controller class for the AcademicsCbtTestSearchForScreen.
///
/// This class manages the state of the AcademicsCbtTestSearchForScreen, including the
/// current academicsCbtTestSearchForModelObj
class AcademicsCbtTestSearchForController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsCbtTestSearchForModel> academicsCbtTestSearchForModelObj =
      AcademicsCbtTestSearchForModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
