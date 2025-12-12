import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/reports_ward_progress_subject_two_controller.dart';
import 'models/listline_item_model.dart';
import 'models/reportsward_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class ReportswardPage extends StatelessWidget {
  ReportswardPage({Key? key}) : super(key: key);

  ReportsWardProgressSubjectTwoController controller = Get.put(
    ReportsWardProgressSubjectTwoController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.max,
        children: [_buildColumnshowing(), _buildListline()],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnshowing() {
    return SizedBox(
      width: double.maxFinite,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 24.h, top: 10.h, bottom: 10.h),
            decoration: AppDecoration.outline,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "msg_showing_averages3".tr,
                  style: CustomTextStyles.bodySmallWhiteA700,
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
                  .reportswardModelObj
                  .value
                  .listlineItemList
                  .value
                  .length,
          itemBuilder: (context, index) {
            ListlineItemModel model =
                controller
                    .reportswardModelObj
                    .value
                    .listlineItemList
                    .value[index];
            return ListlineItemWidget(model);
          },
        ),
      ),
    );
  }
}
