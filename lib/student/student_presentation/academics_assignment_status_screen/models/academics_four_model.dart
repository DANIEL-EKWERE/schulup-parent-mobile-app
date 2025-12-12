// TODO Implement this library.
import 'package:schulupparent/student/data/model/selectionPopupModel/selection_popup_model.dart';

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
      heading: "lbl_word_problems".tr.obs,
      subheading: "msg_mathematics_posted".tr.obs,
      dueOnNov52025: "msg_due_on_nov_5_2025".tr.obs,
    ),
    ListlineItemModel(
      heading: "msg_the_respiratory".tr.obs,
      subheading: "msg_basic_science".tr.obs,
      dueOnNov52025: "msg_due_on_oct_30".tr.obs,
    ),
  ]);


  Rx<List<ListlineItemModel>> listlineItemListcbt = Rx([
    ListlineItemModel(
      heading: "lbl_current_affairs".tr.obs,
      subheading: "msg_history_0_of_1".tr.obs,
      dueOnNov52025: "msg_open_sep_29_2025".tr.obs,
    ),
    ListlineItemModel(
      heading: "lbl_paul_of_tarsus".tr.obs,
      subheading: "msg_christian_religious".tr.obs,
      dueOnNov52025: "msg_open_nov_3_2025".tr.obs,
    ),
  ]);


  Rx<List<ListlineItemModel>> listlineItemListLesson = Rx([
    ListlineItemModel(
      heading: "msg_processes_of_soil".tr.obs,
      subheading: "msg_agricultural_science2".tr.obs,
    ),
    ListlineItemModel(
      heading: "msg_simple_ratios_and".tr.obs,
      subheading: "msg_mathematics_nov".tr.obs,
    ),
    ListlineItemModel(
      heading: "msg_direct_and_indirect".tr.obs,
      subheading: "msg_english_nov_3".tr.obs,
    ),
    ListlineItemModel(
      heading: "msg_the_solar_system".tr.obs,
      subheading: "msg_basic_science3".tr.obs,
    ),
    ListlineItemModel(
      heading: "msg_traffic_rules_and".tr.obs,
      subheading: "msg_social_studies3".tr.obs,
    ),
    ListlineItemModel(
      heading: "msg_nouns_verbs_and".tr.obs,
      subheading: "msg_english_oct_29".tr.obs,
    ),
  ]);
}
