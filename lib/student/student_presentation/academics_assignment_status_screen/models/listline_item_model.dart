// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.heading,
    this.subheading,
    this.dueOnNov52025,
    this.id,
  }) {
    heading = heading ?? Rx("lbl_word_problems".tr);
    subheading = subheading ?? Rx("msg_mathematics_posted".tr);
    dueOnNov52025 = dueOnNov52025 ?? Rx("msg_due_on_nov_5_2025".tr);
    id = id ?? Rx("");
  }

  Rx<String>? heading;

  Rx<String>? subheading;

  Rx<String>? dueOnNov52025;

  Rx<String>? id;

  // static List<ListlineItemModel> getListlineItemList() {
  //   return [
  //     ListlineItemModel(
  //       id: Rx("1"),
  //       heading: Rx("Word Problems"),
  //       subheading: Rx("Mathematics Posted"),
  //       dueOnNov52025: Rx("Due on Nov 5, 2025"),
  //     ),
  //     ListlineItemModel(
  //       id: Rx("2"),
  //     ),
  //     ListlineItemModel(
  //       id: Rx("3"),
  //     ),
  //     ListlineItemModel(
  //       id: Rx("4"),
  //     ),
  //   ];
  // }
}
