// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.thursdayaugtwen,
    this.dropoff,
    this.time,
    this.pickup,
    this.timeoneController,
    this.id,
  }) {
    thursdayaugtwen = thursdayaugtwen ?? Rx("msg_thursday_aug_21".tr);
    dropoff = dropoff ?? Rx("lbl_drop_off".tr);
    time = time ?? Rx("lbl_11_00_am".tr);
    pickup = pickup ?? Rx("lbl_pick_up".tr);
    timeoneController = timeoneController ?? TextEditingController();
    id = id ?? Rx("");
  }

  Rx<String>? thursdayaugtwen;

  Rx<String>? dropoff;

  Rx<String>? time;

  Rx<String>? pickup;

  TextEditingController? timeoneController;

  Rx<String>? id;
}
