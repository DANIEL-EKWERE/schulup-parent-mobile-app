// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [reports_ward_progress_subject_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class ReportsWardProgressSubjectModel {
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
      primary5a: "msg_primary_4a_first".tr.obs,
      wardscore: "lbl_ward_score".tr.obs,
      classaverage: "lbl_class_average".tr.obs,
    ),
    ListlineItemModel(classaverage: "lbl_class_average".tr.obs),
    ListlineItemModel(),
  ]);
}
