// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_events_model.dart';

/// A controller class for the NewsEventsScreen.
///
/// This class manages the state of the NewsEventsScreen, including the
/// current newsEventsModelObj
class NewsEventsController extends GetxController {
  Rx<NewsEventsModel> newsEventsModelObj = NewsEventsModel().obs;
}
