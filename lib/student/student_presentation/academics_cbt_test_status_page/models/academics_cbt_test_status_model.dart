// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [academics_cbt_test_status_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsCbtTestStatusModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      currentaffairs: "lbl_current_affairs".tr.obs,
      history0ofone: "msg_history_0_of_1".tr.obs,
      opensep29202510: "msg_open_sep_29_2025".tr.obs,
    ),
    ListlineItemModel(
      currentaffairs: "lbl_paul_of_tarsus".tr.obs,
      history0ofone: "msg_christian_religious".tr.obs,
      opensep29202510: "msg_open_nov_3_2025".tr.obs,
    ),
  ]);
}
