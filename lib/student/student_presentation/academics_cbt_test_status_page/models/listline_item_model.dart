// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.currentaffairs,
    this.history0ofone,
    this.opensep29202510,
    this.id,
  }) {
    currentaffairs = currentaffairs ?? Rx("lbl_current_affairs".tr);
    history0ofone = history0ofone ?? Rx("msg_history_0_of_1".tr);
    opensep29202510 = opensep29202510 ?? Rx("msg_open_sep_29_2025".tr);
    id = id ?? Rx("");
  }

  Rx<String>? currentaffairs;

  Rx<String>? history0ofone;

  Rx<String>? opensep29202510;

  Rx<String>? id;
}
