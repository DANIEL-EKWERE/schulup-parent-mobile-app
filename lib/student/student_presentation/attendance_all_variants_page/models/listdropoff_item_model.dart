// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

/// This class is used in the [listdropoff_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListdropoffItemModel {
  ListdropoffItemModel({this.dropoff, this.timeController, this.id}) {
    dropoff = dropoff ?? Rx("lbl_drop_off".tr);
    timeController = timeController ?? TextEditingController();
    id = id ?? Rx("");
  }

  Rx<String>? dropoff;

  TextEditingController? timeController;

  Rx<String>? id;
}
