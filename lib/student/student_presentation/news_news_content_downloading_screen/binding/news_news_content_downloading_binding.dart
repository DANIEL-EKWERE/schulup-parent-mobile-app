// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/news_news_content_downloading_controller.dart';

/// A binding class for the NewsNewsContentDownloadingScreen.
///
/// This class ensures that the NewsNewsContentDownloadingController is created when the
/// NewsNewsContentDownloadingScreen is first loaded.
class NewsNewsContentDownloadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsNewsContentDownloadingController());
  }
}
