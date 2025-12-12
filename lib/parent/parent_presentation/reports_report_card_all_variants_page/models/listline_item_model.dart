// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({this.duration, this.tuesdayseptthir, this.id}) {
    duration = duration ?? Rx("msg_day_18_primary".tr);
    tuesdayseptthir = tuesdayseptthir ?? Rx("msg_tuesday_sept_30".tr);
    id = id ?? Rx("");
  }

  Rx<String>? duration;

  Rx<String>? tuesdayseptthir;

  Rx<String>? id;
}
