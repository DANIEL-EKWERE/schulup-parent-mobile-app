import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_drop_down.dart';
import 'controller/academics_cbt_test_status_one_controller.dart';
import 'models/academics_cbt_test_status_one_model.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class AcademicsCbtTestStatusOnePage extends StatelessWidget {
  AcademicsCbtTestStatusOnePage({Key? key}) : super(key: key);

  AcademicsCbtTestStatusOneController controller = Get.put(
    AcademicsCbtTestStatusOneController(AcademicsCbtTestStatusOneModel().obs),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_buildColumnprimaryco()],
          ),
        ),
      ),
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
                      horizontal: 52.h,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: CustomDropDown(
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
                                    .academicsCbtTestStatusOneModelObj
                                    .value
                                    .dropdownItemList!
                                    .value,
                            contentPadding: EdgeInsets.all(12.h),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "lbl_test_result".tr,
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
                            .academicsCbtTestStatusOneModelObj
                            .value
                            .listlineItemList
                            .value
                            .length,
                    itemBuilder: (context, index) {
                      ListlineItemModel model =
                          controller
                              .academicsCbtTestStatusOneModelObj
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
