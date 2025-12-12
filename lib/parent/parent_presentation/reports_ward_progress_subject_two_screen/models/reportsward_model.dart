// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class is used in the [reportsward_page] screen.

// ignore_for_file: must_be_immutable
class ReportswardModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      primary5a: "msg_primary_5a_first".tr.obs,
      wardscore: "lbl_ward_score".tr.obs,
      classaverage: "lbl_class_average".tr.obs,
    ),
    ListlineItemModel(
      primary5a: "msg_primary_4a_third".tr.obs,
      wardscore: "lbl_ward_score".tr.obs,
      classaverage: "lbl_class_average".tr.obs,
    ),
    ListlineItemModel(
      primary5a: "msg_primary_4a_second".tr.obs,
      wardscore: "lbl_ward_score".tr.obs,
      classaverage: "lbl_class_average".tr.obs,
    ),
    ListlineItemModel(
      primary5a: "msg_primary_4a_first".tr.obs,
      wardscore: "lbl_ward_score".tr.obs,
      classaverage: "lbl_class_average".tr.obs,
    ),
    ListlineItemModel(
      wardscore: "lbl_ward_score".tr.obs,
      classaverage: "lbl_class_average".tr.obs,
    ),
  ]);
}
