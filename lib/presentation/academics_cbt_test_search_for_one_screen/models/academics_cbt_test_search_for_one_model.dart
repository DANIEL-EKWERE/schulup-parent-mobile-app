import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [academics_cbt_test_search_for_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsCbtTestSearchForOneModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      trafficrules: "msg_traffic_rules_and".tr.obs,
      socialstudies: "msg_social_studies".tr.obs,
      opensep29202510: "msg_open_sep_29_2025".tr.obs,
    ),
    ListlineItemModel(
      trafficrules: "msg_national_symbols".tr.obs,
      socialstudies: "msg_social_studies2".tr.obs,
      opensep29202510: "msg_submitted_on_jan".tr.obs,
    ),
  ]);
}
