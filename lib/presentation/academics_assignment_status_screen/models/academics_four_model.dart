// TODO Implement this library.
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class is used in the [academics_four_page] screen.

// ignore_for_file: must_be_immutable
class AcademicsFourModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList2 = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      wordproblems: "lbl_word_problems".tr.obs,
      mathematics: "msg_mathematics_posted".tr.obs,
      dueOnNov52025: "msg_due_on_nov_5_2025".tr.obs,
    ),
    ListlineItemModel(
      wordproblems: "msg_the_respiratory".tr.obs,
      mathematics: "msg_basic_science".tr.obs,
      dueOnNov52025: "msg_due_on_oct_30".tr.obs,
    ),
  ]);
}
