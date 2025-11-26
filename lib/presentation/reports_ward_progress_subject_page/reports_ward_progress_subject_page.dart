// TODO Implement this library.
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_one_bottomsheet/controller/reports_ward_progress_subject_one_controller.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_one_bottomsheet/reports_ward_progress_subject_one_bottomsheet.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_page/models/subject_progress_model.dart';
import 'package:schulupparent/presentation/reports_ward_progress_subject_page/widgets/shimmer_widget.dart';
import '../../core/app_export.dart';
import 'controller/reports_ward_progress_subject_controller.dart';
import 'models/listline_item_model.dart';
import 'models/reports_ward_progress_subject_model.dart';
import 'widgets/listline_item_widget.dart';

// ignore_for_file: must_be_immutable
class ReportsWardProgressSubjectPage extends StatelessWidget {
  ReportsWardProgressSubjectPage({Key? key}) : super(key: key);

  ReportsWardProgressSubjectController controller = Get.put(
    ReportsWardProgressSubjectController(ReportsWardProgressSubjectModel().obs),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              //  SizedBox(height: 10.h),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    spacing: 16.h,
                    mainAxisSize: MainAxisSize.max,
                    //  mainAxisSize: MainAxisSize.max,
                    children: [_buildColumnshowing(), _buildListline()],
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
  Widget _buildColumnshowing() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: Get.context!,
          builder: (context) {
            return ReportsWardProgressSubjectOneBottomsheet(
              ReportsWardProgressSubjectOneController(),
            );
          },
        );
      },
      child: SizedBox(
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
                    "Showing averages for ${controller.selectedSubject?.name ?? ''}",
                    style: CustomTextStyles.bodySmallWhiteA700,
                  ),
                ],
              ),
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
        () =>
            controller.isLoading.value
                ? ListView.separated(
                  itemCount: 5,
                  //isLoading ? 5 : newsItems.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    // if (isLoading) {
                    return SubjectProgressShimmerWidget();
                    // }
                    // return ListlineItemWidget(newsItems[index]);
                  },
                )
                : ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemCount: controller.subjectProgressDataList.length,
                  itemBuilder: (context, index) {
                    SubjectProgressData model =
                        controller.subjectProgressDataList[index];
                    return ListlineItemWidget(model);
                  },
                ),
      ),
    );
  }
}
