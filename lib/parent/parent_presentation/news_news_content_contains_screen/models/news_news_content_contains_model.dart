// TODO Implement this library.
import '../../../core/app_export.dart';
import 'listweburl_item_model.dart';

/// This class defines the variables used in the [news_news_content_contains_screen],
/// and is typically used to hold data that is passed between different parts of the application.

// ignore_for_file: must_be_immutable
class NewsNewsContentContainsModel {
  Rx<List<ListweburlItemModel>> listweburlItemList = Rx(
    List.generate(2, (index) => ListweburlItemModel()),
  );
}
