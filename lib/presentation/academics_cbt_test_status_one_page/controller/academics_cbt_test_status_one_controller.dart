// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';
import '../models/academics_cbt_test_status_one_model.dart';

/// A controller class for the AcademicsCbtTestStatusOnePage.
///
/// This class manages the state of the AcademicsCbtTestStatusOnePage, including the
/// current academicsCbtTestStatusOneModelObj
class AcademicsCbtTestStatusOneController extends GetxController {
  AcademicsCbtTestStatusOneController(this.academicsCbtTestStatusOneModelObj);

  Rx<AcademicsCbtTestStatusOneModel> academicsCbtTestStatusOneModelObj;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element
        in academicsCbtTestStatusOneModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    academicsCbtTestStatusOneModelObj.value.dropdownItemList.refresh();
  }
}
