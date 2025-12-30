// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_subject_two_model.dart';
import '../models/reportsward_model.dart';

/// A controller class for the ReportsWardProgressSubjectTwoScreen.
///
/// This class manages the state of the ReportsWardProgressSubjectTwoScreen, including the
/// current reportsWardProgressSubjectTwoModelObj
class ReportsWardProgressSubjectTwoController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<ReportsWardProgressSubjectTwoModel> reportsWardProgressSubjectTwoModelObj =
      ReportsWardProgressSubjectTwoModel().obs;

  late TabController tabviewController;
  //  = Get.put(
  //   TabController(vsync: this, length: 3),
  // );

  @override
  void onInit() {
    super.onInit();
     tabviewController = TabController(vsync: this, length: 3);

      // Add listener to sync tab changes
      tabviewController.addListener(() {
        if (!tabviewController.indexIsChanging) {
          tabIndex.value = tabviewController.index;
        }
      });
  }

  Rx<ReportswardModel> reportswardModelObj = ReportswardModel().obs;

  Rx<int> tabIndex = 0.obs;
}
