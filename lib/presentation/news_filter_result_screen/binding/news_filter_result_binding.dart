// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/news_filter_result_controller.dart';

/// A binding class for the NewsFilterResultScreen.
///
/// This class ensures that the NewsFilterResultController is created when the
/// NewsFilterResultScreen is first loaded.
class NewsFilterResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsFilterResultController());
  }
}
