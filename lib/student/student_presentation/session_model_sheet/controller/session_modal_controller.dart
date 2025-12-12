// TODO Implement this library.
import 'package:schulupparent/student/student_presentation/session_model_sheet/models/session_modal_model.dart';
import '../../../core/app_export.dart';

/// A controller class for the ReportsReportCardModalOneBottomsheet.
///
/// This class manages the state of the ReportsReportCardModalOneBottomsheet, including the
/// current reportsReportCardModalOneModelObj
class SessionModalController extends GetxController {
  Rx<SessionModalModel> reportsReportCardModalOneModelObj =
      SessionModalModel().obs;
}
