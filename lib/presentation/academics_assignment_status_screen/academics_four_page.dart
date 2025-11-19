import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'controller/academics_assignment_status_controller.dart';
import 'models/academics_four_model.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class AcademicsFourPage extends StatelessWidget {
  AcademicsFourPage({Key? key}) : super(key: key);

  AcademicsAssignmentStatusController controller = Get.put(
    AcademicsAssignmentStatusController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(children: [_buildColumnprimaryco()]),
    );
  }

  /// Section Widget
  Widget _buildColumnprimaryco() {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          spacing: 14,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: AppDecoration.outline,
              width: double.maxFinite,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.h,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  .academicsFourModelObj
                                  .value
                                  .dropdownItemList!
                                  .value,
                          contentPadding: EdgeInsets.all(12.h),
                        ),
                        CustomDropDown(
                          width: 88.h,
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
                          hintText: "lbl_first_term".tr,
                          items:
                              controller
                                  .academicsFourModelObj
                                  .value
                                  .dropdownItemList1!
                                  .value,
                          contentPadding: EdgeInsets.all(12.h),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.h),
                          child: CustomDropDown(
                            width: 76.h,
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
                            hintText: "lbl_pending".tr,
                            items:
                                controller
                                    .academicsFourModelObj
                                    .value
                                    .dropdownItemList2!
                                    .value,
                            contentPadding: EdgeInsets.all(12.h),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
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
                            .academicsFourModelObj
                            .value
                            .listlineItemList
                            .value
                            .length,
                    itemBuilder: (context, index) {
                      ListlineItemModel model =
                          controller
                              .academicsFourModelObj
                              .value
                              .listlineItemList
                              .value[index];
                      return ListlineItemWidget(model);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
