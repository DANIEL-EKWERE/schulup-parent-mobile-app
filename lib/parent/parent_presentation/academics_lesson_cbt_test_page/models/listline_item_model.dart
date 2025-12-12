// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({this.processesof, this.agricultural, this.id}) {
    processesof = processesof ?? Rx("msg_processes_of_soil".tr);
    agricultural = agricultural ?? Rx("msg_agricultural_science2".tr);
    id = id ?? Rx("");
  }

  Rx<String>? processesof;

  Rx<String>? agricultural;

  Rx<String>? id;
}
