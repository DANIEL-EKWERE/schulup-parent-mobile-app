// TODO Implement this library.
import '../../../core/app_export.dart';
import 'chipviewdueonoc_item_model.dart';

/// This class defines the variables used in the [academics_assignment_submitted_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class AcademicsAssignmentSubmittedModel {
  Rx<List<ChipviewdueonocItemModel>> chipviewdueonocItemList = Rx([
    ChipviewdueonocItemModel(dueonoct302025: "msg_due_on_oct_30".tr.obs),
    ChipviewdueonocItemModel(dueonoct302025: "msg_submitted_on_nov".tr.obs),
  ]);
}
