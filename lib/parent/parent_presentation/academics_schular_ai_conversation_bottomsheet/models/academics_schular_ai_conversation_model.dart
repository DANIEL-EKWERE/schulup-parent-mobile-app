// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listline_item_model.dart';

/// This class defines the variables used in the [academics_schular_ai_conversation_bottomsheet],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsSchularAiConversationModel {
  Rx<List<ListlineItemModel>> listlineItemList = Rx([
    ListlineItemModel(
      understanding: "msg_understanding_the".tr.obs,
      nov102025: "lbl_nov_10_20252".tr.obs,
    ),
    ListlineItemModel(
      understanding: "msg_how_to_solve_simple".tr.obs,
      nov102025: "lbl_oct_24_2025".tr.obs,
    ),
    ListlineItemModel(
      understanding: "msg_discussing_nigeria_s".tr.obs,
      nov102025: "lbl_oct_22_2025".tr.obs,
    ),
    ListlineItemModel(
      understanding: "msg_learning_about_local".tr.obs,
      nov102025: "lbl_sept_24_2025".tr.obs,
    ),
    ListlineItemModel(
      understanding: "msg_explaining_the_stages".tr.obs,
      nov102025: "lbl_sept_18_2025".tr.obs,
    ),
  ]);
}
