// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_news_content_downloading_model.dart';

/// A controller class for the NewsNewsContentDownloadingScreen.
///
/// This class manages the state of the NewsNewsContentDownloadingScreen, including the
/// current newsNewsContentDownloadingModelObj
class NewsNewsContentDownloadingController extends GetxController {
  Rx<NewsNewsContentDownloadingModel> newsNewsContentDownloadingModelObj =
      NewsNewsContentDownloadingModel().obs;
}
