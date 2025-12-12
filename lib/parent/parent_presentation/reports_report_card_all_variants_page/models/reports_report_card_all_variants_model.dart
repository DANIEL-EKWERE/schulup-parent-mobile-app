import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [reports_report_card_all_variants_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class ReportsReportCardAllVariantsModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      duration: "msg_day_18_primary".tr.obs,
      tuesdayseptthir: "msg_tuesday_sept_30".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_day_17_primary".tr.obs,
      tuesdayseptthir: "msg_monday_sept_29".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_day_16_primary".tr.obs,
      tuesdayseptthir: "msg_friday_sept_26".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_day_15_primary".tr.obs,
      tuesdayseptthir: "msg_thursday_sept".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_day_14_primary".tr.obs,
      tuesdayseptthir: "msg_wednesday_sept".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_day_13_primary".tr.obs,
      tuesdayseptthir: "msg_tuesday_sept_23".tr.obs,
    ),
  ]);

  Rx<List<ListlineItemModel>> listlineItemWeeklyList = Rx([
    ListlineItemModel(
      duration: "msg_week_6_primary".tr.obs,
      tuesdayseptthir: "msg_monday_oct_6".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_week_5_primary".tr.obs,
      tuesdayseptthir: "msg_monday_sept_292".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_week_4_primary".tr.obs,
      tuesdayseptthir: "msg_monday_sept_22".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_week_3_primary".tr.obs,
      tuesdayseptthir: "msg_monday_sept_15".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_week_2_primary".tr.obs,
      tuesdayseptthir: "msg_monday_sept_8".tr.obs,
    ),
    ListlineItemModel(
      duration: "msg_week_1_primary".tr.obs,
      tuesdayseptthir: "msg_monday_sept_1".tr.obs,
    ),
  ]);
}
