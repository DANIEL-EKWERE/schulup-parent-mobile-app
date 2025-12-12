// TODO Implement this library.
import 'package:schulupparent/parent/data/model/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [academics_lesson_all_lessons_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsAssignmentModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      processesof: "msg_processes_of_soil".tr.obs,
      agricultural: "msg_agricultural_science2".tr.obs,
    ),
    ListlineItemModel(
      processesof: "msg_simple_ratios_and".tr.obs,
      agricultural: "msg_mathematics_nov".tr.obs,
    ),
    ListlineItemModel(
      processesof: "msg_direct_and_indirect".tr.obs,
      agricultural: "msg_english_nov_3".tr.obs,
    ),
    ListlineItemModel(
      processesof: "msg_the_solar_system".tr.obs,
      agricultural: "msg_basic_science3".tr.obs,
    ),
    ListlineItemModel(
      processesof: "msg_traffic_rules_and".tr.obs,
      agricultural: "msg_social_studies3".tr.obs,
    ),
    ListlineItemModel(
      processesof: "msg_nouns_verbs_and".tr.obs,
      agricultural: "msg_english_oct_29".tr.obs,
    ),
  ]);
}
