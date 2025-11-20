// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_buttomsheet/academics_assignment_modal_buttomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_buttomsheet/controller/academics_assignment_modal_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_four_bottomsheet/academics_assignment_modal_four_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_four_bottomsheet/controller/academics_assignment_modal_four_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_one_bottomsheet/academics_assignment_modal_one_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_one_bottomsheet/controller/academics_assignment_modal_one_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_two_bottomsheet/academics_assignment_modal_two_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_modal_two_bottomsheet/controller/academics_assignment_modal_two_controller.dart';
import 'package:schulupparent/presentation/academics_assignment_three_bottomsheet/academics_assignment_three_bottomsheet.dart';
import 'package:schulupparent/presentation/academics_assignment_three_bottomsheet/controller/academics_assignment_modal_three_controller.dart';
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
        top: false,
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
            height: 80.h,
            leadingWidth: 55.h,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
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
                    onTapArrowleftone();
                  },
                ),
              ),
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
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: Get.context!,
                            builder: (context) {
                              return AcademicsAssignmentModalBottomsheet(
                                AcademicsAssignmentModalController(),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "lbl_primary_5".tr,
                              style: theme.textTheme.labelLarge,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyDown,
                              height: 16.h,
                              width: 18.h,
                              margin: EdgeInsets.only(left: 10.h),
                            ),
                          ],
                        ),
                      ),
                      Spacer(flex: 40),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: Get.context!,
                            builder: (context) {
                              // upload a file modal bottom sheet
                              // return AcademicsAssignmentModalFourBottomsheet(
                              //   AcademicsAssignmentModalFourController(),
                              // );
                              // select status modal bottom sheet with two options
                              // return AcademicsAssignmentModalTwoBottomsheet(
                              //   AcademicsAssignmentModalTwoController(),
                              // );

                              // still status with all options
                              // return AcademicsAssignmentModalThreeBottomsheet(
                              //   AcademicsAssignmentModalThreeController(),
                              // );
                              // primary school selection modal bottom sheet
                              // return AcademicsAssignmentModalBottomsheet(
                              //   AcademicsAssignmentModalController(),
                              // );

                              return AcademicsAssignmentModalOneBottomsheet(
                                AcademicsAssignmentModalOneController(),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
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
                          ],
                        ),
                      ),
                      Spacer(flex: 59),
                      GestureDetector(
                        onTap: () {
                          // status selection modal bottom sheet
                          showModalBottomSheet(
                            context: Get.context!,
                            builder: (context) {
                              return AcademicsAssignmentModalThreeBottomsheet(
                                AcademicsAssignmentModalThreeController(),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "lbl_all".tr,
                              style: theme.textTheme.labelLarge,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgIconsTinyDown,
                              height: 16.h,
                              width: 18.h,
                              margin: EdgeInsets.only(left: 10.h, right: 20.h),
                            ),
                          ],
                        ),
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
