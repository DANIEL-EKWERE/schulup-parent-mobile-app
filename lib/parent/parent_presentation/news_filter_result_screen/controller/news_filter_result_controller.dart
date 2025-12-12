// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_filter_result_model.dart';

/// A controller class for the NewsFilterResultScreen.
///
/// This class manages the state of the NewsFilterResultScreen, including the
/// current newsFilterResultModelObj
class NewsFilterResultController extends GetxController {
  Rx<NewsFilterResultModel> newsFilterResultModelObj =
      NewsFilterResultModel().obs;
}
