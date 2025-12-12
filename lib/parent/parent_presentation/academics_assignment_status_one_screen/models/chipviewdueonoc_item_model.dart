// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [chipviewdueonoc_item_widget] screen.

// ignore_for_file: must_be_immutable
class ChipviewdueonocItemModel {
  ChipviewdueonocItemModel({this.dueonoct292025, this.isSelected}) {
    dueonoct292025 = dueonoct292025 ?? Rx("msg_due_on_oct_29".tr);
    isSelected = isSelected ?? Rx(false);
  }

  Rx<String>? dueonoct292025;

  Rx<bool>? isSelected;
}
