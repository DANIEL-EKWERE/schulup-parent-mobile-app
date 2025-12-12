import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.personal,
    this.homeeconomics,
    this.submittedonjanT,
    this.id,
  }) {
    personal = personal ?? Rx("msg_personal_hygiene".tr);
    homeeconomics = homeeconomics ?? Rx("msg_home_economics".tr);
    submittedonjanT = submittedonjanT ?? Rx("msg_submitted_on_jan".tr);
    id = id ?? Rx("");
  }

  Rx<String>? personal;

  Rx<String>? homeeconomics;

  Rx<String>? submittedonjanT;

  Rx<String>? id;
}
