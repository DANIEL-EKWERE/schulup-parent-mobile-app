// TODO Implement this library.
import 'package:schulupparent/data/model/selectionPopupModel/selection_popup_model.dart';

import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [academics_assignment_search_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsAssignmentSearchOneModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);

  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      vocabulary: "msg_vocabulary_development".tr.obs,
      english: "msg_english_language3".tr.obs,
      dueonoct302025: "msg_due_on_oct_30".tr.obs,
    ),
    ListlineItemModel(
      vocabulary: "msg_letter_writing".tr.obs,
      english: "msg_english_language4".tr.obs,
      dueonoct302025: "msg_due_on_nov_5_2025".tr.obs,
    ),
    ListlineItemModel(
      vocabulary: "msg_subject_verb_agreement".tr.obs,
      english: "msg_english_language".tr.obs,
    ),
  ]);
}
