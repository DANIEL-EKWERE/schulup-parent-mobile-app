import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({this.understanding, this.nov102025, this.id}) {
    understanding = understanding ?? Rx("msg_understanding_the".tr);
    nov102025 = nov102025 ?? Rx("lbl_nov_10_20252".tr);
    id = id ?? Rx("");
  }

  Rx<String>? understanding;

  Rx<String>? nov102025;

  Rx<String>? id;
}
