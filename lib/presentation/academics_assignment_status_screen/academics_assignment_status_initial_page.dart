// // TODO Implement this library.import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// import '../../core/app_export.dart';
// import '../../widgets/app_bar/appbar_subtitle_five.dart';
// import '../../widgets/app_bar/appbar_subtitle_one.dart';
// import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import 'controller/academics_assignment_status_controller.dart';
// import 'models/academics_assignment_status_initial_model.dart';

// // ignore_for_file: must_be_immutable
// class AcademicsAssignmentStatusInitialPage extends StatelessWidget {
//   AcademicsAssignmentStatusInitialPage({Key? key}) : super(key: key);

//   AcademicsAssignmentStatusController controller = Get.put(
//     AcademicsAssignmentStatusController(),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       decoration: AppDecoration.grayC13,
//       child: Column(
//         children: [
//           Expanded(
//             child: SizedBox(
//               height: 694.h,
//               width: double.maxFinite,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Container(
//                     child: TabBarView(
//                       controller: controller.tabviewController,
//                       children: [],
//                     ),
//                   ),
//                   _buildColumnacademics(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Section Widget
//   Widget _buildColumnacademics() {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Container(
//         width: double.maxFinite,
//         padding: EdgeInsets.symmetric(vertical: 18.h),
//         decoration: AppDecoration.primaryC7Main,
//         child: Column(
//           spacing: 16,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomAppBar(
//               height: 38.h,
//               centerTitle: true,
//               title: Column(
//                 children: [
//                   AppbarSubtitleOne(text: "lbl_academics".tr),
//                   AppbarSubtitleFive(
//                     text: "lbl_ogechi".tr,
//                     margin: EdgeInsets.only(left: 28.h, right: 29.h),
//                   ),
//                 ],
//               ),
//               actions: [
//                 AppbarTrailingIconbutton(
//                   imagePath: ImageConstant.imgIconsSmallSchularAi,
//                 ),
//                 AppbarTrailingIconbutton(
//                   imagePath: ImageConstant.imgSearch,
//                   margin: EdgeInsets.only(left: 11.h, right: 25.h),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: double.maxFinite,
//               child: Obx(
//                 () => Container(
//                   margin: EdgeInsets.symmetric(horizontal: 66.h),
//                   child: TabBar(
//                     controller: controller.tabviewController,
//                     isScrollable: true,
//                     tabAlignment: TabAlignment.start,
//                     labelColor: appTheme.whiteA700,
//                     labelStyle: TextStyle(
//                       fontSize: 12.fSize,
//                       fontFamily: 'Rubik',
//                       fontWeight: FontWeight.w500,
//                     ),
//                     unselectedLabelColor: theme.colorScheme.onPrimary,
//                     unselectedLabelStyle: TextStyle(
//                       fontSize: 12.fSize,
//                       fontFamily: 'Rubik',
//                       fontWeight: FontWeight.w400,
//                     ),
//                     tabs: [
//                       Tab(
//                         height: 38,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration:
//                               controller.tabIndex.value == 0
//                                   ? BoxDecoration(
//                                     color: theme.colorScheme.onPrimary,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   )
//                                   : BoxDecoration(
//                                     color: appTheme.whiteA700,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 14.h,
//                               vertical: 10.h,
//                             ),
//                             child: Text("lbl_assignment".tr),
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         height: 38,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration:
//                               controller.tabIndex.value == 1
//                                   ? BoxDecoration(
//                                     color: theme.colorScheme.onPrimary,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   )
//                                   : BoxDecoration(
//                                     color: appTheme.whiteA700,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 14.h,
//                               vertical: 10.h,
//                             ),
//                             child: Text("lbl_cbt_test".tr),
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         height: 38,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration:
//                               controller.tabIndex.value == 2
//                                   ? BoxDecoration(
//                                     color: theme.colorScheme.onPrimary,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   )
//                                   : BoxDecoration(
//                                     color: appTheme.whiteA700,
//                                     borderRadius: BorderRadius.circular(18.h),
//                                   ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 14.h,
//                               vertical: 10.h,
//                             ),
//                             child: Text("lbl_lesson".tr),
//                           ),
//                         ),
//                       ),
//                     ],
//                     indicatorColor: Colors.transparent,
//                     onTap: (index) {
//                       controller.tabIndex.value = index;
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 28.h),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/academics_assignment_status_controller.dart';
import 'models/academics_assignment_status_initial_model.dart';

class AcademicsAssignmentStatusInitialPage extends StatelessWidget {
  AcademicsAssignmentStatusInitialPage({Key? key}) : super(key: key);

  AcademicsAssignmentStatusController controller = Get.put(
    AcademicsAssignmentStatusController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: AppDecoration.grayC13,
      child: Column(
        children: [
          _buildColumnacademics(),
          Expanded(
            child: TabBarView(
              controller: controller.tabviewController,
              children: [
                // Assignment Tab Content
                _buildAssignmentTab(),

                // CBT Test Tab Content
                _buildCBTTestTab(),

                // Lesson Tab Content
                _buildLessonTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget - Header with tabs
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
            height: 38.h,
            centerTitle: true,
            title: Column(
              children: [
                AppbarSubtitleOne(text: "lbl_academics".tr),
                AppbarSubtitleFive(
                  text: "lbl_ogechi".tr,
                  margin: EdgeInsets.only(left: 28.h, right: 29.h),
                ),
              ],
            ),
            actions: [
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgIconsSmallSchularAi,
              ),
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgSearch,
                margin: EdgeInsets.only(left: 11.h, right: 25.h),
              ),
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => Container(
                margin: EdgeInsets.symmetric(horizontal: 46.h),
                child: TabBar(
                  controller: controller.tabviewController,
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 4),
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.center,
                  labelColor: appTheme.whiteA700,
                  labelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: theme.colorScheme.onPrimary,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.fSize,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 0
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("lbl_assignment".tr),
                        ),
                      ),
                    ),
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 1
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("lbl_cbt_test".tr),
                        ),
                      ),
                    ),
                    Tab(
                      height: 38,
                      child: Container(
                        alignment: Alignment.center,
                        decoration:
                            controller.tabIndex.value == 2
                                ? BoxDecoration(
                                  color: theme.colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(18.h),
                                )
                                : BoxDecoration(
                                  color: appTheme.whiteA700,
                                  borderRadius: BorderRadius.circular(18.h),
                                ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 10.h,
                          ),
                          child: Text("lbl_lesson".tr),
                        ),
                      ),
                    ),
                  ],
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    controller.tabIndex.value = index;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Assignment Tab Content
  Widget _buildAssignmentTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          // Add your assignment content here
          Center(
            child: Text(
              "Assignment Content",
              style: theme.textTheme.titleLarge,
            ),
          ),
          // Example: Add assignment list or empty state
        ],
      ),
    );
  }

  /// CBT Test Tab Content
  Widget _buildCBTTestTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          // Add your CBT test content here
          Center(
            child: Text("CBT Test Content", style: theme.textTheme.titleLarge),
          ),
        ],
      ),
    );
  }

  /// Lesson Tab Content
  Widget _buildLessonTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.h),
      child: Column(
        children: [
          // Add your lesson content here
          Center(
            child: Text("Lesson Content", style: theme.textTheme.titleLarge),
          ),
        ],
      ),
    );
  }
}
