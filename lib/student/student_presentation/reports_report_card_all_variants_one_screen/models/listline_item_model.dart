// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({this.week6primary, this.mondayoctsix, this.id}) {
    week6primary = week6primary ?? Rx("msg_week_6_primary".tr);
    mondayoctsix = mondayoctsix ?? Rx("msg_monday_oct_6".tr);
    id = id ?? Rx("");
  }

  Rx<String>? week6primary;

  Rx<String>? mondayoctsix;

  Rx<String>? id;
}
