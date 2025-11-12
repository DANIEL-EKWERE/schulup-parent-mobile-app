// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listyellowhouse_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListyellowhouseItemModel {
  ListyellowhouseItemModel({
    this.image,
    this.yellowhouse,
    this.itwas,
    this.attachments,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgSteptodownCom882553);
    yellowhouse = yellowhouse ?? Rx("msg_yellow_house_wins".tr);
    itwas = itwas ?? Rx("msg_it_was_excitement".tr);
    attachments = attachments ?? Rx("msg_5_attachments".tr);
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? yellowhouse;

  Rx<String>? itwas;

  Rx<String>? attachments;

  Rx<String>? id;
}
