// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/news_modal_jump_to_a_date_model.dart';

/// A controller class for the NewsModalJumpToADateBottomsheet.
///
/// This class manages the state of the NewsModalJumpToADateBottomsheet, including the
/// current newsModalJumpToADateModelObj
class NewsModalJumpToADateController extends GetxController {
  Rx<NewsModalJumpToADateModel> newsModalJumpToADateModelObj =
      NewsModalJumpToADateModel().obs;
}
