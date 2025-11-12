import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_news_content_contains_model.dart';

/// A controller class for the NewsNewsContentContainsScreen.
///
/// This class manages the state of the NewsNewsContentContainsScreen, including the
/// current newsNewsContentContainsModelObj
class NewsNewsContentContainsController extends GetxController {
  Rx<NewsNewsContentContainsModel> newsNewsContentContainsModelObj =
      NewsNewsContentContainsModel().obs;
}
