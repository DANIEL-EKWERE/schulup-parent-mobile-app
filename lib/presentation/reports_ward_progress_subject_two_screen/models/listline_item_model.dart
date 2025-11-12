// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({
    this.primary5a,
    this.wardscore,
    this.classaverage,
    this.frame427321469Controller,
    this.frame427321470Controller,
    this.id,
  }) {
    primary5a = primary5a ?? Rx("msg_primary_5a_first".tr);
    wardscore = wardscore ?? Rx("lbl_ward_score".tr);
    classaverage = classaverage ?? Rx("lbl_class_average".tr);
    frame427321469Controller =
        frame427321469Controller ?? TextEditingController();
    frame427321470Controller =
        frame427321470Controller ?? TextEditingController();
    id = id ?? Rx("");
  }

  Rx<String>? primary5a;

  Rx<String>? wardscore;

  Rx<String>? classaverage;

  TextEditingController? frame427321469Controller;

  TextEditingController? frame427321470Controller;

  Rx<String>? id;
}
