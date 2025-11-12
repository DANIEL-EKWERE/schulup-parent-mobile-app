// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listyellowhouse_item_model.dart';

/// This class defines the variables used in the [news_filter_result_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class NewsFilterResultModel {
  Rx<List<ListyellowhouseItemModel>> listyellowhouseItemList = Rx([
    ListyellowhouseItemModel(
      image: ImageConstant.imgSteptodownCom882553.obs,
      yellowhouse: "msg_yellow_house_wins".tr.obs,
      itwas: "msg_it_was_excitement".tr.obs,
      attachments: "msg_5_attachments".tr.obs,
    ),
    ListyellowhouseItemModel(
      image: ImageConstant.imgImage63.obs,
      yellowhouse: "msg_graceland_celebrates".tr.obs,
      itwas: "msg_graceland_school2".tr.obs,
      attachments: "msg_7_attachments".tr.obs,
    ),
  ]);
}
