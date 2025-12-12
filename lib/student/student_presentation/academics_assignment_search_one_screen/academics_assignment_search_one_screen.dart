// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title_searchview_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import 'controller/academics_assignment_search_one_controller.dart';
import 'models/listline_item_model.dart';
import 'widgets/listline_item_widget.dart'; // ignore_for_file: must_be_immutable

class AcademicsAssignmentSearchOneScreen
    extends GetWidget<AcademicsAssignmentSearchOneController> {
  const AcademicsAssignmentSearchOneScreen({Key? key}) : super(key: key);

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
                hintText: "msg_english_language2".tr,
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
                                .academicsAssignmentSearchOneModelObj
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
                  .academicsAssignmentSearchOneModelObj
                  .value
                  .listlineItemList
                  .value
                  .length,
          itemBuilder: (context, index) {
            ListlineItemModel model =
                controller
                    .academicsAssignmentSearchOneModelObj
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
