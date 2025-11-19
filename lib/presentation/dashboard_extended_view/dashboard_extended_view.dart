import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:schulupparent/core/utils/image_constant.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/models/models.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/widget/widget.dart';
import 'package:schulupparent/theme/app_decoration.dart';
import 'package:schulupparent/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:schulupparent/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:schulupparent/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:schulupparent/widgets/app_bar/custom_app_bar.dart';
import 'package:schulupparent/widgets/custom_image_view.dart';

import '../../core/utils/size_utils.dart';

DashboardExtendedViewController controller = Get.put(
  DashboardExtendedViewController(),
);

class DashboardExtendedView extends StatefulWidget {
  const DashboardExtendedView({super.key});

  @override
  State<DashboardExtendedView> createState() => _DashboardExtendedViewState();
}

class _DashboardExtendedViewState extends State<DashboardExtendedView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.grayC13,
      child: Column(
        children: [
          _buildColumnacademics(),
          Expanded(child: Column(children: [])),
        ],
      ),
    );
  }

  Widget _buildColumnacademics() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            height: 58.h,
            //centerTitle: true,
            title: Container(
              width: 100,
              // height: 150,
              margin: EdgeInsets.only(left: 16),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xff27262B),

                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CustomImageView(
                      imagePath: 'assets/images/ward_image.png',
                    ),
                  ),
                  AppbarSubtitleFive(
                    text: "lbl_ogechi".tr,
                    margin: EdgeInsets.only(left: 8.h, right: 9.h),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgChevronDown,
                    height: 17,
                    width: 17,
                  ),
                ],
              ),
            ),
            // Column(
            //   children: [
            //     AppbarSubtitleOne(text: "lbl_academics".tr),
            // AppbarSubtitleFive(
            //   text: "lbl_ogechi".tr,
            //   margin: EdgeInsets.only(left: 28.h, right: 29.h),
            // ),
            //   ],
            // ),
            actions: [
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgNotification,
              ),
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgLetter,
                margin: EdgeInsets.only(left: 11.h),
              ),
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgSettings1,
                margin: EdgeInsets.only(left: 11.h, right: 25.h),
              ),
            ],
          ),
          //SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppbarSubtitleOne(text: "lbl_academics".tr),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.maxFinite,
              height: 190,
              child: GridView.builder(
                itemCount: DashboardExtendedViewModel.getSampleList().length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 4,
                  childAspectRatio: 1.2 / 1.6,
                ),
                itemBuilder: (context, index) {
                  DashboardExtendedViewModel model =
                      DashboardExtendedViewModel.getSampleList()[index];
                  return DashboardItemWidget(model);
                },
              ),
              // child: Obx(
              //   () => Container(
              //     margin: EdgeInsets.symmetric(horizontal: 46.h),
              //     child: TabBar(
              //       controller: controller.tabviewController,
              //       isScrollable: true,
              //       padding: EdgeInsets.zero,
              //       labelPadding: EdgeInsets.symmetric(horizontal: 4),
              //       dividerColor: Colors.transparent,
              //       tabAlignment: TabAlignment.center,
              //       labelColor: appTheme.whiteA700,
              //       labelStyle: TextStyle(
              //         fontSize: 12.fSize,
              //         fontFamily: 'Rubik',
              //         fontWeight: FontWeight.w500,
              //       ),
              //       unselectedLabelColor: theme.colorScheme.onPrimary,
              //       unselectedLabelStyle: TextStyle(
              //         fontSize: 12.fSize,
              //         fontFamily: 'Rubik',
              //         fontWeight: FontWeight.w400,
              //       ),
              //       tabs: [
              //         Tab(
              //           height: 38,
              //           child: Container(
              //             alignment: Alignment.center,
              //             decoration: controller.tabIndex.value == 0
              //                 ? BoxDecoration(
              //                     color: theme.colorScheme.onPrimary,
              //                     borderRadius: BorderRadius.circular(18.h),
              //                   )
              //                 : BoxDecoration(
              //                     color: appTheme.whiteA700,
              //                     borderRadius: BorderRadius.circular(18.h),
              //                   ),
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(
              //                 horizontal: 14.h,
              //                 vertical: 10.h,
              //               ),
              //               child: Text("lbl_assignment".tr),
              //             ),
              //           ),
              //         ),
              //         Tab(
              //           height: 38,
              //           child: Container(
              //             alignment: Alignment.center,
              //             decoration: controller.tabIndex.value == 1
              //                 ? BoxDecoration(
              //                     color: theme.colorScheme.onPrimary,
              //                     borderRadius: BorderRadius.circular(18.h),
              //                   )
              //                 : BoxDecoration(
              //                     color: appTheme.whiteA700,
              //                     borderRadius: BorderRadius.circular(18.h),
              //                   ),
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(
              //                 horizontal: 14.h,
              //                 vertical: 10.h,
              //               ),
              //               child: Text("lbl_cbt_test".tr),
              //             ),
              //           ),
              //         ),
              //         Tab(
              //           height: 38,
              //           child: Container(
              //             alignment: Alignment.center,
              //             decoration: controller.tabIndex.value == 2
              //                 ? BoxDecoration(
              //                     color: theme.colorScheme.onPrimary,
              //                     borderRadius: BorderRadius.circular(18.h),
              //                   )
              //                 : BoxDecoration(
              //                     color: appTheme.whiteA700,
              //                     borderRadius: BorderRadius.circular(18.h),
              //                   ),
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(
              //                 horizontal: 14.h,
              //                 vertical: 10.h,
              //               ),
              //               child: Text("lbl_lesson".tr),
              //             ),
              //           ),
              //         ),
              //       ],
              //       indicatorColor: Colors.transparent,
              //       onTap: (index) {
              //         controller.tabIndex.value = index;
              //       },
              //     ),
              //   ),
              //  ),
            ),
          ),
        ],
      ),
    );
  }
}
