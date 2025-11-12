// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/schulup_logo_svg_controller.dart';

/// A binding class for the SchulupLogoSvgScreen.
///
/// This class ensures that the SchulupLogoSvgController is created when the
/// SchulupLogoSvgScreen is first loaded.
class SchulupLogoSvgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SchulupLogoSvgController());
  }
}
