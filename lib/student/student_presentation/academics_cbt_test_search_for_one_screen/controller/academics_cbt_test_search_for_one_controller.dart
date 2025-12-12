// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_search_for_one_model.dart';

/// A controller class for the AcademicsCbtTestSearchForOneScreen.
///
/// This class manages the state of the AcademicsCbtTestSearchForOneScreen, including the
/// current academicsCbtTestSearchForOneModelObj
class AcademicsCbtTestSearchForOneController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsCbtTestSearchForOneModel> academicsCbtTestSearchForOneModelObj =
      AcademicsCbtTestSearchForOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
