// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/parent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_search_two_model.dart';

/// A controller class for the AcademicsAssignmentSearchTwoScreen.
///
/// This class manages the state of the AcademicsAssignmentSearchTwoScreen, including the
/// current academicsAssignmentSearchTwoModelObj
class AcademicsAssignmentSearchTwoController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsAssignmentSearchTwoModel> academicsAssignmentSearchTwoModelObj =
      AcademicsAssignmentSearchTwoModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  onSelected(dynamic value) {
    for (var element
        in academicsAssignmentSearchTwoModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsAssignmentSearchTwoModelObj.value.dropdownItemList.refresh();
  }
}
