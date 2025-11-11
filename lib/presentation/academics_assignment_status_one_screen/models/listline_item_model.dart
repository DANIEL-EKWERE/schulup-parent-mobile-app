// TODO Implement this library.
import '../../../core/app_export.dart';
import 'chipviewdueonoc_item_model.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.partsofspeech,
    this.english,
    this.dueonoct292025,
    this.submittedonoctT,
    this.chipviewdueonocItemList,
    this.id,
  }) {
    partsofspeech = partsofspeech ?? Rx("lbl_parts_of_speech".tr);
    english = english ?? Rx("msg_english_language".tr);
    dueonoct292025 = dueonoct292025 ?? Rx("msg_due_on_oct_29".tr);
    submittedonoctT = submittedonoctT ?? Rx("msg_submitted_on_oct".tr);
    chipviewdueonocItemList =
        chipviewdueonocItemList ??
        Rx([
          ChipviewdueonocItemModel(dueonoct292025: "msg_due_on_oct_29".tr.obs),
          ChipviewdueonocItemModel(
            dueonoct292025: "msg_submitted_on_oct".tr.obs,
          ),
        ]);
    id = id ?? Rx("");
  }

  Rx<String>? partsofspeech;

  Rx<String>? english;

  Rx<String>? dueonoct292025;

  Rx<String>? submittedonoctT;

  Rx<List<ChipviewdueonocItemModel>>? chipviewdueonocItemList;

  Rx<String>? id;
}
