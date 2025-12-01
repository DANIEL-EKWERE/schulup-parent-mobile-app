// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/cbt_detail_model.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/academics_cbt_test_test_details_controller.dart'; // ignore_for_file: must_be_immutable

DashboardExtendedViewController dashboardExtendedViewController = Get.find<DashboardExtendedViewController>();
class AcademicsCbtTestTestDetailsScreen
    extends GetWidget<AcademicsCbtTestTestDetailsController> {
  const AcademicsCbtTestTestDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CbtDetail model = Get.arguments['model'];
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 24.h, top: 18.h, right: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.quizTitle!,
                              style: CustomTextStyles.titleMediumOnPrimary,
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              width: double.maxFinite,
                              child: Divider(
                                color: appTheme.gray400.withValues(alpha: 0.5),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              width: double.maxFinite,
                              child: _buildRownoofquestion(
                                noofquestions: "lbl_subject".tr,
                                tenOne: model.subjectName!,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            SizedBox(
                              width: double.maxFinite,
                              child: _buildRownoofquestion(
                                noofquestions: "msg_no_of_questions".tr,
                                tenOne: model.noOfQuestions.toString(),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: double.maxFinite,
                              child: _buildRownoofquestion(
                                noofquestions: "lbl_time_limit".tr,
                                tenOne: "${model.timeLimit} minutes",
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: double.maxFinite,
                              child: _buildRownoofquestion(
                                noofquestions: "msg_allowed_attempts".tr,
                                tenOne: model.allowedAttempts!,
                              ),
                            ),
                            SizedBox(height: 18.h),
                            SizedBox(
                              width: double.maxFinite,
                              child: Divider(
                                color: appTheme.gray400.withValues(alpha: 0.5),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "lbl_instructions".tr,
                              style: CustomTextStyles.bodyMediumOnPrimary,
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              model.instructions!,
                              maxLines: 17,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall!.copyWith(
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildColumnstart(model),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      leadingWidth: 59.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgArrowLeftWhiteA700,
        margin: EdgeInsets.only(left: 25.h, top: 22.h, bottom: 8.h),
        onTap: () {
          onTapArrowleftone();
        },
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitleOne(text: "lbl_cbt_test".tr),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.only(left: 19.h, right: 20.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildColumnstart(CbtDetail model) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
      decoration: AppDecoration.primaryC10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            onPressed: () {
              controller.startTest(model.quizScheduleID.toString());
            },
            height: 64.h,
            text: "lbl_start_test".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: theme.textTheme.titleMedium!,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildRownoofquestion({
    required String noofquestions,
    required String tenOne,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          noofquestions,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
        Text(
          tenOne,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    // Get.back();
    Navigator.pop(Get.context!);
  }
}
