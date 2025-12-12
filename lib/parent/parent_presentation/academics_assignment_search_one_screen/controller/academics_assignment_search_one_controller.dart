// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/parent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_search_one_model.dart';

/// A controller class for the AcademicsAssignmentSearchOneScreen.
///
/// This class manages the state of the AcademicsAssignmentSearchOneScreen, including the
/// current academicsAssignmentSearchOneModelObj
class AcademicsAssignmentSearchOneController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsAssignmentSearchOneModel> academicsAssignmentSearchOneModelObj =
      AcademicsAssignmentSearchOneModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  onSelected(dynamic value) {
    for (var element
        in academicsAssignmentSearchOneModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsAssignmentSearchOneModelObj.value.dropdownItemList.refresh();
  }
}
