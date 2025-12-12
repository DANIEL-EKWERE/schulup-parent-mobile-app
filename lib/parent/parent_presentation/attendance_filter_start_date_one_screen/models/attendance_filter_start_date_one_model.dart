// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [attendance_filter_start_date_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AttendanceFilterStartDateOneModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      thursdayaugtwen: "msg_thursday_aug_21".tr.obs,
      dropoff: "lbl_drop_off".tr.obs,
      time: "lbl_11_00_am".tr.obs,
      pickup: "lbl_pick_up".tr.obs,
    ),
    ListlineItemModel(
      thursdayaugtwen: "msg_wednesday_aug".tr.obs,
      dropoff: "lbl_drop_off".tr.obs,
      time: "lbl_10_20_am".tr.obs,
      pickup: "lbl_check_out".tr.obs,
    ),
    ListlineItemModel(thursdayaugtwen: "msg_tuesday_aug_19".tr.obs),
  ]);
}
