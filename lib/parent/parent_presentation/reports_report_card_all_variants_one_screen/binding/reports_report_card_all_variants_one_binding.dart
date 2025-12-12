// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/reports_report_card_all_variants_one_controller.dart';

/// A binding class for the ReportsReportCardAllVariantsOneScreen.
///
/// This class ensures that the ReportsReportCardAllVariantsOneController is created when the
/// ReportsReportCardAllVariantsOneScreen is first loaded.
class ReportsReportCardAllVariantsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsReportCardAllVariantsOneController());
  }
}
