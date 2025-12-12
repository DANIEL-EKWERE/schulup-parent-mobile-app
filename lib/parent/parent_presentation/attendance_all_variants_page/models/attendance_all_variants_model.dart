// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'listdropoff_item_model.dart';

/// This class defines the variables used in the [attendance_all_variants_page],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AttendanceAllVariantsModel {
  Rx<List<ListdropoffItemModel>> listdropoffItemList = Rx([
    ListdropoffItemModel(dropoff: "lbl_drop_off".tr.obs),
    ListdropoffItemModel(dropoff: "lbl_check_out".tr.obs),
    ListdropoffItemModel(dropoff: "lbl_check_in".tr.obs),
    ListdropoffItemModel(dropoff: "lbl_pick_up".tr.obs),
  ]);

  Rx<TimeOfDay>? selectedTime = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeOne = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeTwo = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeThree = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeFour = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeFive = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeSix = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeSeven = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeNine = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeTen = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeEleven = Rx(TimeOfDay.now());

  Rx<TimeOfDay>? selectedTimeTwelve = Rx(TimeOfDay.now());
}
