// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/schulup_logo_svg_model.dart';

/// A controller class for the SchulupLogoSvgScreen.
///
/// This class manages the state of the SchulupLogoSvgScreen, including the
/// current schulupLogoSvgModelObj
class SchulupLogoSvgController extends GetxController {
  Rx<SchulupLogoSvgModel> schulupLogoSvgModelObj = SchulupLogoSvgModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.academicsAssignmentStatusScreen);
    });
  }
}
