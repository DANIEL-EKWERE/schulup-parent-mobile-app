// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title_searchview_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/academics_cbt_test_search_for_one_controller.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart'; // ignore_for_file: must_be_immutable

class AcademicsCbtTestSearchForOneScreen
    extends GetWidget<AcademicsCbtTestSearchForOneController> {
  const AcademicsCbtTestSearchForOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildColumnarrowleft(),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 24.h, top: 14.h, right: 24.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [_buildListline()],
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
              child: AppbarTitleSearchviewOne(
                margin: EdgeInsets.only(left: 16.h, right: 25.h),
                hintText: "lbl_social_studies".tr,
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
                    horizontal: 56.h,
                    vertical: 8.h,
                  ),
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
                      Spacer(),
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

  /// Section Widget
  Widget _buildListline() {
    return Expanded(
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
                  .academicsCbtTestSearchForOneModelObj
                  .value
                  .listlineItemList
                  .value
                  .length,
          itemBuilder: (context, index) {
            ListlineItemModel model =
                controller
                    .academicsCbtTestSearchForOneModelObj
                    .value
                    .listlineItemList
                    .value[index];
            return ListlineItemWidget(model);
          },
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
