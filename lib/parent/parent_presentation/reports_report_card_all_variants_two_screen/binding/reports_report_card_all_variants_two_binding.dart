// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/reports_report_card_all_variants_two_controller.dart';

/// A binding class for the ReportsReportCardAllVariantsTwoScreen.
///
/// This class ensures that the ReportsReportCardAllVariantsTwoController is created when the
/// ReportsReportCardAllVariantsTwoScreen is first loaded.
class ReportsReportCardAllVariantsTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsReportCardAllVariantsTwoController());
  }
}
