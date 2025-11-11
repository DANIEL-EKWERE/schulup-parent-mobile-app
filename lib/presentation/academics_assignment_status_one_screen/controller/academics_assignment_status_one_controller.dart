// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_status_one_model.dart';
import '../models/academics_four_model.dart';

/// A controller class for the AcademicsAssignmentStatusOneScreen.
///
/// This class manages the state of the AcademicsAssignmentStatusOneScreen, including the
/// current academicsAssignmentStatusOneModelObj
class AcademicsAssignmentStatusOneController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<AcademicsAssignmentStatusOneModel> academicsAssignmentStatusOneModelObj =
      AcademicsAssignmentStatusOneModel().obs;

  late TabController tabviewController = Get.put(
    TabController(vsync: this, length: 3),
  );

  Rx<AcademicsFourModel> academicsFourModelObj = AcademicsFourModel().obs;

  Rx<int> tabIndex = 0.obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  onSelected(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList3.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList3.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in academicsFourModelObj.value.dropdownItemList4.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsFourModelObj.value.dropdownItemList4.refresh();
  }
}
