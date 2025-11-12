// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_news_content_no_image_model.dart';

/// A controller class for the NewsNewsContentNoImageScreen.
///
/// This class manages the state of the NewsNewsContentNoImageScreen, including the
/// current newsNewsContentNoImageModelObj
class NewsNewsContentNoImageController extends GetxController {
  Rx<NewsNewsContentNoImageModel> newsNewsContentNoImageModelObj =
      NewsNewsContentNoImageModel().obs;
}
