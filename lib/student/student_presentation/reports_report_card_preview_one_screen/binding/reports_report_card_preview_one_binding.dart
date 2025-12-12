import '../../../core/app_export.dart';
import '../controller/reports_report_card_preview_one_controller.dart';

/// A binding class for the ReportsReportCardPreviewOneScreen.
///
/// This class ensures that the ReportsReportCardPreviewOneController is created when the
/// ReportsReportCardPreviewOneScreen is first loaded.
class ReportsReportCardPreviewOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsReportCardPreviewOneController());
  }
}
