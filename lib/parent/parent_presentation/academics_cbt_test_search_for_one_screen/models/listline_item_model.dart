// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.trafficrules,
    this.socialstudies,
    this.opensep29202510,
    this.id,
  }) {
    trafficrules = trafficrules ?? Rx("msg_traffic_rules_and".tr);
    socialstudies = socialstudies ?? Rx("msg_social_studies".tr);
    opensep29202510 = opensep29202510 ?? Rx("msg_open_sep_29_2025".tr);
    id = id ?? Rx("");
  }

  Rx<String>? trafficrules;

  Rx<String>? socialstudies;

  Rx<String>? opensep29202510;

  Rx<String>? id;
}
