import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:schulupparent/widgets/app_bar/custom_app_bar.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'controller/academics_lesson_all_lessons_controller.dart';
import 'models/academics_lesson_all_lessons_model.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class AcademicsLessonAllLessonsPage extends StatelessWidget {
  AcademicsLessonAllLessonsPage({Key? key}) : super(key: key);

  AcademicsLessonAllLessonsController controller = Get.put(
    AcademicsLessonAllLessonsController(AcademicsLessonAllLessonsModel().obs),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        height: 56.h,
        leadingWidth: 75.h,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 10,
            width: 10,
            //margin: EdgeInsets.only(left: 25.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffEF5A07),
              border: Border.all(color: Color(0xffFFBC71)),
            ),
            child: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              //margin: EdgeInsets.only(left: 25.h),
              onTap: () {
                Get.back();
              },
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "All Lessons",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontSize: 20.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // SizedBox(height: 10.h),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    spacing: 14,
                    mainAxisSize: MainAxisSize.max,
                    children: [_buildRowprimarycount(), _buildListline()],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowprimarycount() {
    return Container(
      decoration: AppDecoration.primaryC7Main,
      width: double.maxFinite,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 54.h, vertical: 0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDropDown(
                  width: 84.h,
                  icon: Container(
                    margin: EdgeInsets.only(left: 10.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIconsTinyDown,
                      height: 16.h,
                      width: 16.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  iconSize: 16.h,
                  hintText: "lbl_primary_5".tr,
                  items:
                      controller
                          .academicsLessonAllLessonsModelObj
                          .value
                          .dropdownItemList!
                          .value,
                  contentPadding: EdgeInsets.all(12.h),
                ),
                Spacer(),
                Text("lbl_first_term".tr, style: theme.textTheme.labelLarge),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsTinyDown,
                  height: 16.h,
                  width: 18.h,
                  margin: EdgeInsets.only(left: 10.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildListline() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Obx(
          () => ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
            itemCount:
                controller
                    .academicsLessonAllLessonsModelObj
                    .value
                    .listlineItemList
                    .value
                    .length,
            itemBuilder: (context, index) {
              ListlineItemModel model =
                  controller
                      .academicsLessonAllLessonsModelObj
                      .value
                      .listlineItemList
                      .value[index];
              return ListlineItemWidget(model);
            },
          ),
        ),
      ),
    );
  }
}
