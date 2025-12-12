// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [chipviewdueonoc_item_widget] screen.

// ignore_for_file: must_be_immutable
class ChipviewdueonocItemModel {
  ChipviewdueonocItemModel({this.dueonoct302025, this.isSelected}) {
    dueonoct302025 = dueonoct302025 ?? Rx("msg_due_on_oct_30".tr);
    isSelected = isSelected ?? Rx(false);
  }

  Rx<String>? dueonoct302025;

  Rx<bool>? isSelected;
}
