// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_assignment_search_model.dart';

/// A controller class for the AcademicsAssignmentSearchScreen.
///
/// This class manages the state of the AcademicsAssignmentSearchScreen, including the
/// current academicsAssignmentSearchModelObj
class AcademicsAssignmentSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<AcademicsAssignmentSearchModel> academicsAssignmentSearchModelObj =
      AcademicsAssignmentSearchModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  onSelected(dynamic value) {
    for (var element
        in academicsAssignmentSearchModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsAssignmentSearchModelObj.value.dropdownItemList.refresh();
  }
}
