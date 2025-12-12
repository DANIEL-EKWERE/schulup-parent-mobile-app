// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listjuncounter_item_model.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [news_events_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class NewsEventsModel {
  Rx<List<ListjuncounterItemModel>> listjuncounterItemList = Rx([
    ListjuncounterItemModel(junCounter: "lbl_jun_2025".tr.obs),
    ListjuncounterItemModel(junCounter: "lbl_jul_2025".tr.obs),
    ListjuncounterItemModel(junCounter: "lbl_sept_2025".tr.obs),
    ListjuncounterItemModel(junCounter: "lbl_oct_2025".tr.obs),
    ListjuncounterItemModel(junCounter: "lbl_nov_2025".tr.obs),
  ]);

  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      mondaynovthree: "msg_monday_nov_3".tr.obs,
      label: "lbl_add_to_calendar".tr.obs,
      secondterm: "msg_second_term_resumes".tr.obs,
    ),
    ListlineItemModel(
      mondaynovthree: "msg_thursday_nov_6".tr.obs,
      label: "lbl_add_to_calendar".tr.obs,
      secondterm: "msg_orientation_for".tr.obs,
    ),
    ListlineItemModel(
      mondaynovthree: "msg_monday_nov_10".tr.obs,
      label: "lbl_add_to_calendar".tr.obs,
      secondterm: "msg_commencement_of".tr.obs,
    ),
    ListlineItemModel(
      mondaynovthree: "msg_wednesday_nov".tr.obs,
      label: "lbl_add_to_calendar".tr.obs,
      secondterm: "msg_club_society_registration".tr.obs,
    ),
    ListlineItemModel(
      mondaynovthree: "msg_saturday_dec_6".tr.obs,
      label: "lbl_add_to_calendar".tr.obs,
      secondterm: "msg_inter_house_sports".tr.obs,
    ),
    ListlineItemModel(
      mondaynovthree: "msg_saturday_dec_12".tr.obs,
      label: "lbl_add_to_calendar".tr.obs,
      secondterm: "lbl_mid_term_test".tr.obs,
    ),
    ListlineItemModel(
      mondaynovthree: "msg_monday_feb_2".tr.obs,
      label: "lbl_add_to_calendar".tr.obs,
      secondterm: "msg_second_term_exam".tr.obs,
    ),
  ]);
}
