import '../../../core/app_export.dart';
import '../controller/reports_report_card_downloading_controller.dart';

/// A binding class for the ReportsReportCardDownloadingScreen.
///
/// This class ensures that the ReportsReportCardDownloadingController is created when the
/// ReportsReportCardDownloadingScreen is first loaded.
class ReportsReportCardDownloadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsReportCardDownloadingController());
  }
}
