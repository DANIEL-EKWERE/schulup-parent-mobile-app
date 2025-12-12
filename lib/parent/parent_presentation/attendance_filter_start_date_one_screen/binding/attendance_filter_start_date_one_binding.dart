// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/attendance_filter_start_date_one_controller.dart';

/// A binding class for the AttendanceFilterStartDateOneScreen.
///
/// This class ensures that the AttendanceFilterStartDateOneController is created when the
/// AttendanceFilterStartDateOneScreen is first loaded.
class AttendanceFilterStartDateOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceFilterStartDateOneController());
  }
}
