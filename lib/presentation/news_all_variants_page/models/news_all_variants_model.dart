// TODO Implement this library.
import '../../../core/app_export.dart';
import 'news_all_item_model.dart';

/// This class defines the variables used in the [news_all_variants_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class NewsAllVariantsModel {
  Rx<List<NewsAllItemModel>> newsAllItemList = Rx([
    NewsAllItemModel(
      gracelandhosts: "msg_graceland_hosts".tr.obs,
      students: "msg_students_parents".tr.obs,
      attachments: "msg_3_attachments".tr.obs,
    ),
    NewsAllItemModel(),
    NewsAllItemModel(),
  ]);
}
