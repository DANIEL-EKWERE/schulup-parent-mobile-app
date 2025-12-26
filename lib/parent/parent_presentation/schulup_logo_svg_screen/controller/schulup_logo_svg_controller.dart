// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/admin/core/utils/storage.dart';
import 'package:schulupparent/admin/presentation/home_screen/home_screen.dart';
import 'package:schulupparent/parent/core/utils/storage.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_status_screen/academics_assignment_status_screen.dart';
import 'package:schulupparent/student/core/utils/storage.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/academics_assignment_status_screen.dart';
import '../../../core/app_export.dart';
import '../models/schulup_logo_svg_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the SchulupLogoSvgScreen.
///
/// This class manages the state of the SchulupLogoSvgScreen, including the
/// current schulupLogoSvgModelObj
class SchulupLogoSvgController extends GetxController {
  Rx<SchulupLogoSvgModel> schulupLogoSvgModelObj = SchulupLogoSvgModel().obs;
  //AppRoutes.academicsAssignmentStatusScreen
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      // Get.offNamed(AppRoutes.signinScreen);
      dashboard();
    });
  }
  //
  // Future<int> getUserType() async {
  //     SharedPreferences sharedPreferences = await _pref;

  //     if (sharedPreferences.containsKey('userType')) {
  //       int data = sharedPreferences.getInt('userType')!;
  //       //_userId = data;
  //4 - guardian/parent
  //3 - student
  // 2/1 - admin
  //       return data;
  //     } else {
  //       //data = 0;

  //       return 0;
  //     }
  //   }

  void dashboard() async {
    var userType1 = await dataBase.getUserType();
    var userType2 = await studentDataBase.getUserType();
    var userType3 = await adminDataBase.getUserType();
    myLog.log('user type 1 $userType1');
    myLog.log('user tpe 2 $userType2');
    myLog.log("user type 3 $userType3");
    if (userType1 == 0 && userType2 == 0 && userType3 == 0) {
      Get.offNamed(AppRoutes.signinScreen);
    } else if (userType1 == 4 
    //&& userType2 == 0 && userType3 == 0
    ) {
      Get.offAll(() => AcademicsAssignmentStatusScreen());
    } else if (userType2 == 3 
    //&& userType1 == 0 && userType3 == 0
    ) {
      Get.offAll(() => StudentAcademicsAssignmentStatusScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }
}
