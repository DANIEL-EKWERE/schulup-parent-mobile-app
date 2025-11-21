// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_status_initial_model.dart';
import '../models/academics_assignment_status_model.dart';
import '../models/academics_four_model.dart';

/// A controller class for the AcademicsAssignmentStatusScreen.
///
/// This class manages the state of the AcademicsAssignmentStatusScreen, including the
/// current academicsAssignmentStatusModelObj
class AcademicsAssignmentStatusController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<AcademicsAssignmentStatusModel> academicsAssignmentStatusModelObj =
      AcademicsAssignmentStatusModel().obs;

  late TabController tabviewController = Get.put(
    TabController(vsync: this, length: 3),
  );

  Rx<AcademicsFourModel> academicsFourModelObj = AcademicsFourModel().obs;

  Rx<AcademicsAssignmentStatusInitialModel>
  academicsAssignmentStatusInitialModelObj =
      AcademicsAssignmentStatusInitialModel().obs;

  Rx<int> tabIndex = 0.obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  onSelected(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList2.refresh();
  }

  Rx<String> classType = 'primary 5'.obs;

  Rx<String> termType = 'First Term'.obs;

  Rx<String> statusType = 'Pending'.obs;

// cbt
  Rx<String> classType1 = 'primary 50'.obs;

  Rx<String> cbtType = 'Scheduled Test 0'.obs;

// lesson
  Rx<String> classType2 = 'primary 50'.obs;

  Rx<String> termType1 = 'First Term 0'.obs;

  //search
  Rx<String> searchStatus = 'All'.obs;
}
