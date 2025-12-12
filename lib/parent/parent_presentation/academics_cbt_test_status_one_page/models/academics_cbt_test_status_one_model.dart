// TODO Implement this library.
import 'package:schulupparent/parent/data/model/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [academics_cbt_test_status_one_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsCbtTestStatusOneModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      personal: "msg_personal_hygiene".tr.obs,
      homeeconomics: "msg_home_economics".tr.obs,
      submittedonjanT: "msg_submitted_on_jan".tr.obs,
    ),
    ListlineItemModel(
      personal: "msg_matter_and_its_states".tr.obs,
      homeeconomics: "msg_basic_science2".tr.obs,
      submittedonjanT: "msg_submitted_on_apr".tr.obs,
    ),
  ]);
}
