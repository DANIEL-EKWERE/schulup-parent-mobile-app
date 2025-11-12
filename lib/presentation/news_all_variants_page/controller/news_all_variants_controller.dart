// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_all_variants_model.dart';

/// A controller class for the NewsAllVariantsPage.
///
/// This class manages the state of the NewsAllVariantsPage, including the
/// current newsAllVariantsModelObj
class NewsAllVariantsController extends GetxController {
  NewsAllVariantsController(this.newsAllVariantsModelObj);

  Rx<NewsAllVariantsModel> newsAllVariantsModelObj;
}
