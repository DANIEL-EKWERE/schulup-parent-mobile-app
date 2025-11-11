// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.wordproblems,
    this.mathematics,
    this.dueOnNov52025,
    this.id,
  }) {
    wordproblems = wordproblems ?? Rx("lbl_word_problems".tr);
    mathematics = mathematics ?? Rx("msg_mathematics_posted".tr);
    dueOnNov52025 = dueOnNov52025 ?? Rx("msg_due_on_nov_5_2025".tr);
    id = id ?? Rx("");
  }

  Rx<String>? wordproblems;

  Rx<String>? mathematics;

  Rx<String>? dueOnNov52025;

  Rx<String>? id;
}
