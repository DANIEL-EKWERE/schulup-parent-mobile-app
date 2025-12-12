// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [academics_lesson_search_for_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsLessonSearchForOneModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      thesolar: "msg_the_solar_system".tr.obs,
      basicscience: "msg_basic_science4".tr.obs,
    ),
    ListlineItemModel(
      thesolar: "msg_plant_and_animal".tr.obs,
      basicscience: "msg_basic_science5".tr.obs,
    ),
    ListlineItemModel(
      thesolar: "msg_matter_and_its_states".tr.obs,
      basicscience: "msg_basic_science6".tr.obs,
    ),
  ]);
}
