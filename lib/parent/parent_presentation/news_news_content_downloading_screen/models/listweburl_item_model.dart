// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

/// This class is used in the [listweburl_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListweburlItemModel {
  ListweburlItemModel({this.weburlController, this.id}) {
    weburlController = weburlController ?? TextEditingController();
    id = id ?? Rx("");
  }

  TextEditingController? weburlController;

  Rx<String>? id;
}
