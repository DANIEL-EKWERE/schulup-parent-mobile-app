// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.vocabulary,
    this.english,
    this.dueonoct302025,
    this.id,
  }) {
    vocabulary = vocabulary ?? Rx("msg_vocabulary_development".tr);
    english = english ?? Rx("msg_english_language3".tr);
    dueonoct302025 = dueonoct302025 ?? Rx("msg_due_on_oct_30".tr);
    id = id ?? Rx("");
  }

  Rx<String>? vocabulary;

  Rx<String>? english;

  Rx<String>? dueonoct302025;

  Rx<String>? id;
}
