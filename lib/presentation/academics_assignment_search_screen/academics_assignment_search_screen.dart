// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title_searchview.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import 'controller/academics_assignment_search_controller.dart'; // ignore_for_file: must_be_immutable

class AcademicsAssignmentSearchScreen
    extends GetWidget<AcademicsAssignmentSearchController> {
  const AcademicsAssignmentSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildColumnarrowleft(),
              SizedBox(width: double.maxFinite, child: Column(children: [])),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnarrowleft() {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 14,
        children: [
          CustomAppBar(
            height: 50.h,
            leadingWidth: 59.h,
            leading: AppbarLeadingIconbutton(
              imagePath: ImageConstant.imgArrowLeftWhiteA700,
              margin: EdgeInsets.only(left: 25.h, top: 7.h, bottom: 8.h),
              onTap: () {
                onTapArrowleftone();
              },
            ),
            title: SizedBox(
              width: double.maxFinite,
              child: AppbarTitleSearchview(
                margin: EdgeInsets.only(left: 16.h, right: 25.h),
                hintText: "msg_search_for_an_assignment".tr,
                controller: controller.searchController,
              ),
            ),
          ),
          Container(
            decoration: AppDecoration.outline,
            width: double.maxFinite,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.h,
                    vertical: 8.h,
                  ),
                  child: Row(
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
                                .academicsAssignmentSearchModelObj
                                .value
                                .dropdownItemList!
                                .value,
                        contentPadding: EdgeInsets.all(12.h),
                      ),
                      Spacer(flex: 40),
                      Text(
                        "lbl_first_term".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsTinyDown,
                        height: 16.h,
                        width: 18.h,
                        margin: EdgeInsets.only(left: 10.h),
                      ),
                      Spacer(flex: 59),
                      Text("lbl_all".tr, style: theme.textTheme.labelLarge),
                      CustomImageView(
                        imagePath: ImageConstant.imgIconsTinyDown,
                        height: 16.h,
                        width: 18.h,
                        margin: EdgeInsets.only(left: 10.h, right: 20.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
