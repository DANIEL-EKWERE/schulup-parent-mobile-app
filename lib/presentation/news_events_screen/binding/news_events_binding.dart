// TODO Implement this library.
import '../../../core/app_export.dart';
import '../controller/news_events_controller.dart';

/// A binding class for the NewsEventsScreen.
///
/// This class ensures that the NewsEventsController is created when the
/// NewsEventsScreen is first loaded.
class NewsEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsEventsController());
  }
}
