// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listline_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListlineItemModel {
  ListlineItemModel({this.thesolar, this.basicscience, this.id}) {
    thesolar = thesolar ?? Rx("msg_the_solar_system".tr);
    basicscience = basicscience ?? Rx("msg_basic_science4".tr);
    id = id ?? Rx("");
  }

  Rx<String>? thesolar;

  Rx<String>? basicscience;

  Rx<String>? id;
}
