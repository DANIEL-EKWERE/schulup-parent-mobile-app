// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listyear_item_model.dart';

/// This class defines the variables used in the [news_modal_jump_to_a_date_bottomsheet],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class NewsModalJumpToADateModel {
  Rx<List<ListyearItemModel>> listyearItemList = Rx([
    ListyearItemModel(
      year: "lbl_year".tr.obs,
      zipcode: "lbl_2024".tr.obs,
      zipcodeOne: "lbl_2023".tr.obs,
    ),
    ListyearItemModel(
      year: "lbl_month".tr.obs,
      zipcode: "lbl_mar".tr.obs,
      zipcodeOne: "lbl_apr".tr.obs,
    ),
    ListyearItemModel(
      year: "lbl_day".tr.obs,
      zipcode: "lbl_14".tr.obs,
      zipcodeOne: "lbl_15".tr.obs,
    ),
  ]);
}
