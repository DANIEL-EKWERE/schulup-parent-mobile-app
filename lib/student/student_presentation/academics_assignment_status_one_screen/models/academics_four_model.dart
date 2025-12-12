// TODO Implement this library.
import 'package:schulupparent/student/data/model/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class is used in the [academics_four_page] screen.

// ignore_for_file: must_be_immutable
class AcademicsFourModel {
  Rx<List<SelectionPopupModel>> dropdownItemList3 = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList4 = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      partsofspeech: "lbl_parts_of_speech".tr.obs,
      english: "msg_english_language".tr.obs,
    ),
    ListlineItemModel(
      partsofspeech: "msg_types_and_importance".tr.obs,
      english: "msg_agricultural_science".tr.obs,
    ),
  ]);
}
