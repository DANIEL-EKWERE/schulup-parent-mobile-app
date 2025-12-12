import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/academics_cbt_test_status_controller.dart';
import 'models/academics_cbt_test_status_model.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class AcademicsCbtTestStatusPage extends StatelessWidget {
  AcademicsCbtTestStatusPage({Key? key}) : super(key: key);

  AcademicsCbtTestStatusController controller = Get.put(
    AcademicsCbtTestStatusController(AcademicsCbtTestStatusModel().obs),
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
                      horizontal: 40.h,
                      vertical: 10.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Text(
                            "lbl_primary_5".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgIconsTinyDown,
                          height: 16.h,
                          width: 18.h,
                          margin: EdgeInsets.only(left: 10.h),
                        ),
                        Spacer(),
                        Text(
                          "lbl_scheduled_test".tr,
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
                            .academicsCbtTestStatusModelObj
                            .value
                            .listlineItemList
                            .value
                            .length,
                    itemBuilder: (context, index) {
                      ListlineItemModel model =
                          controller
                              .academicsCbtTestStatusModelObj
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
