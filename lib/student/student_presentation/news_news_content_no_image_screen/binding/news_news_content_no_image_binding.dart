// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/news_news_content_no_image_controller.dart';

/// A binding class for the NewsNewsContentNoImageScreen.
///
/// This class ensures that the NewsNewsContentNoImageController is created when the
/// NewsNewsContentNoImageScreen is first loaded.
class NewsNewsContentNoImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsNewsContentNoImageController());
  }
}
