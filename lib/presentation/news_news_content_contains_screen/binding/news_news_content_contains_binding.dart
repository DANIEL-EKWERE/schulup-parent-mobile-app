// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/news_news_content_contains_controller.dart';

/// A binding class for the NewsNewsContentContainsScreen.
///
/// This class ensures that the NewsNewsContentContainsController is created when the
/// NewsNewsContentContainsScreen is first loaded.
class NewsNewsContentContainsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsNewsContentContainsController());
  }
}
