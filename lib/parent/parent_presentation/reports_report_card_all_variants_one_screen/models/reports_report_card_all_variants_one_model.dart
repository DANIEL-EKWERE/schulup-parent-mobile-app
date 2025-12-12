// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [reports_report_card_all_variants_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class ReportsReportCardAllVariantsOneModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      week6primary: "msg_week_6_primary".tr.obs,
      mondayoctsix: "msg_monday_oct_6".tr.obs,
    ),
    ListlineItemModel(
      week6primary: "msg_week_5_primary".tr.obs,
      mondayoctsix: "msg_monday_sept_292".tr.obs,
    ),
    ListlineItemModel(
      week6primary: "msg_week_4_primary".tr.obs,
      mondayoctsix: "msg_monday_sept_22".tr.obs,
    ),
    ListlineItemModel(
      week6primary: "msg_week_3_primary".tr.obs,
      mondayoctsix: "msg_monday_sept_15".tr.obs,
    ),
    ListlineItemModel(
      week6primary: "msg_week_2_primary".tr.obs,
      mondayoctsix: "msg_monday_sept_8".tr.obs,
    ),
    ListlineItemModel(
      week6primary: "msg_week_1_primary".tr.obs,
      mondayoctsix: "msg_monday_sept_1".tr.obs,
    ),
  ]);
}
