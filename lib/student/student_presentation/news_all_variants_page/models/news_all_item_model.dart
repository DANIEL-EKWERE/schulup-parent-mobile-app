// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [news_all_item_widget] screen.

// ignore_for_file: must_be_immutable
class NewsAllItemModel {
  NewsAllItemModel({
    this.gracelandhosts,
    this.students,
    this.attachments,
    this.id,
  }) {
    gracelandhosts = gracelandhosts ?? Rx("msg_graceland_hosts".tr);
    students = students ?? Rx("msg_students_parents".tr);
    attachments = attachments ?? Rx("msg_3_attachments".tr);
    id = id ?? Rx("");
  }

  Rx<String>? gracelandhosts;

  Rx<String>? students;

  Rx<String>? attachments;

  Rx<String>? id;
}
