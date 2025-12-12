// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.mondaynovthree,
    this.label,
    this.secondterm,
    this.id,
  }) {
    mondaynovthree = mondaynovthree ?? Rx("msg_monday_nov_3".tr);
    label = label ?? Rx("lbl_add_to_calendar".tr);
    secondterm = secondterm ?? Rx("msg_second_term_resumes".tr);
    id = id ?? Rx("");
  }

  Rx<String>? mondaynovthree;

  Rx<String>? label;

  Rx<String>? secondterm;

  Rx<String>? id;
}
