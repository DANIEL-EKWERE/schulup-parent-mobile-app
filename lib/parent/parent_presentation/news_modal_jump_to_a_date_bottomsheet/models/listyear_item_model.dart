// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class is used in the [listyear_item_widget] screen.

// ignore_for_file: must_be_immutable
class ListyearItemModel {
  ListyearItemModel({this.year, this.zipcode, this.zipcodeOne, this.id}) {
    year = year ?? Rx("lbl_year".tr);
    zipcode = zipcode ?? Rx("lbl_2024".tr);
    zipcodeOne = zipcodeOne ?? Rx("lbl_2023".tr);
    id = id ?? Rx("");
  }

  Rx<String>? year;

  Rx<String>? zipcode;

  Rx<String>? zipcodeOne;

  Rx<String>? id;
}
