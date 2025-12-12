// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listjuncounter_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListjuncounterItemModel {
  ListjuncounterItemModel({this.junCounter, this.id}) {
    junCounter = junCounter ?? Rx("lbl_jun_2025".tr);
    id = id ?? Rx("");
  }

  Rx<String>? junCounter;

  Rx<String>? id;
}
