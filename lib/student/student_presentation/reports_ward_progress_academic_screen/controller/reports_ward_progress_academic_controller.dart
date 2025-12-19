// TODO Implement this library.
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/reports_ward_progress_academic_model.dart';
import '../models/scrollview_tab_model.dart';


/// A controller class for the ReportsWardProgressAcademicScreen.
///
/// This class manages the state of the ReportsWardProgressAcademicScreen, including the
/// current reportsWardProgressAcademicModelObj
class StudentReportsWardProgressAcademicController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController frame427321469Controller = TextEditingController();

  TextEditingController frame427321470Controller = TextEditingController();

  TextEditingController frame427321471Controller = TextEditingController();

  TextEditingController frame427321472Controller = TextEditingController();

  TextEditingController frame427321473Controller = TextEditingController();

  TextEditingController frame427321474Controller = TextEditingController();

  TextEditingController frame427321475Controller = TextEditingController();

  TextEditingController frame427321476Controller = TextEditingController();

  TextEditingController frame427321477Controller = TextEditingController();

  TextEditingController frame427321478Controller = TextEditingController();

  TextEditingController frame427321479Controller = TextEditingController();

  TextEditingController frame427321480Controller = TextEditingController();

  Rx<ReportsWardProgressAcademicModel> reportsWardProgressAcademicModelObj =
      ReportsWardProgressAcademicModel().obs;

  late TabController tabviewController = Get.put(
    TabController(vsync: this, length: 3),
  );

  Rx<int> tabIndex = 0.obs;

  Rx<ScrollviewTabModel> scrollviewTabModelObj = ScrollviewTabModel().obs;

  @override
  void onClose() {
    super.onClose();
    frame427321469Controller.dispose();
    frame427321470Controller.dispose();
    frame427321471Controller.dispose();
    frame427321472Controller.dispose();
    frame427321473Controller.dispose();
    frame427321474Controller.dispose();
    frame427321475Controller.dispose();
    frame427321476Controller.dispose();
    frame427321477Controller.dispose();
    frame427321478Controller.dispose();
    frame427321479Controller.dispose();
    frame427321480Controller.dispose();
  }
}
