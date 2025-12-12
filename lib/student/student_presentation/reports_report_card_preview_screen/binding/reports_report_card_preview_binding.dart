// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/reports_report_card_preview_controller.dart';

/// A binding class for the ReportsReportCardPreviewScreen.
///
/// This class ensures that the ReportsReportCardPreviewController is created when the
/// ReportsReportCardPreviewScreen is first loaded.
class ReportsReportCardPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsReportCardPreviewController());
  }
}
