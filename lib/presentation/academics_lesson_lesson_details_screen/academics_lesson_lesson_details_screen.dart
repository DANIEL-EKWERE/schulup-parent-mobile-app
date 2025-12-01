// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:intl/intl.dart';
import 'package:schulupparent/presentation/academics_assignment_status_screen/models/lesson_model.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/academics_lesson_lesson_details_controller.dart'; // ignore_for_file: must_be_immutable
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';


DashboardExtendedViewController dashboardExtendedViewController = Get.find<DashboardExtendedViewController>();
class AcademicsLessonLessonDetailsScreen
    extends GetWidget<AcademicsLessonLessonDetailsController> {
  const AcademicsLessonLessonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LessonData lessonData = Get.arguments['lessonData'];
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
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
                        lessonData.title ?? '',
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
                        child: _buildRowpostedon(
                          postedonOne: lessonData.subjectMasterName ?? '',
                          nov52025One: formatDate(lessonData.lastUpdated ?? ''),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: _buildRowpostedon(
                          postedonOne: "lbl_posted_on".tr,
                          nov52025One: "lbl_nov_5_2025".tr,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: Divider(
                          color: appTheme.gray400.withValues(alpha: 0.5),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Lesson Content",
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                      SizedBox(height: 6.h),

                      // Text(
                      //   "msg_soil_is_the_uppermost".tr,
                      //   maxLines: 8,
                      //   overflow: TextOverflow.ellipsis,
                      //   style: theme.textTheme.bodySmall!.copyWith(height: 1.50),
                      // ),
                      html.Html(data: lessonData.lessonContent ?? ''),
                      SizedBox(height: 18.h),
                      //_buildStackf3a3680dfa(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDate(String dateString) {
    // Parse the ISO 8601 date string
    DateTime dateTime = DateTime.parse(dateString);

    // Format it to "Monday, Nov. 3, 2025"
    String formatted = DateFormat('EEEE, MMM. d, yyyy').format(dateTime);

    return formatted;
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
          AppbarSubtitleOne(text: "lbl_lesson".tr),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1!.firstName!,
            margin: EdgeInsets.symmetric(horizontal: 13.h),
          ),
        ],
      ),
      styleType: Style.bgFillPrimary,
    );
  }

  /// Section Widget
  Widget _buildStackf3a3680dfa() {
    return SizedBox(
      width: double.maxFinite,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.zero,
        color: appTheme.gray100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Container(
          height: 192.h,
          width: double.maxFinite,
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgF3a3680dfa1,
                height: 192.h,
                width: double.maxFinite,
                radius: BorderRadius.circular(4.h),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 76.h),
                decoration: AppDecoration.fillBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgFrame427321518,
                      height: 40.h,
                      width: 42.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildRowpostedon({
    required String postedonOne,
    required String nov52025One,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          postedonOne,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
        Text(
          nov52025One,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.gray600),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    //  Get.back();
    Navigator.pop(Get.context!);
  }
}
