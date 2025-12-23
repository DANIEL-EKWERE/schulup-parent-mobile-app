import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/student/core/app_export.dart';
import 'package:schulupparent/student/core/utils/image_constant.dart';
import 'package:schulupparent/student/core/utils/storage.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_page/academics_assignment_page.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_page/controller/academics_assignment_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_page/models/academics_assignment_model.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/controller/academics_assignment_status_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_assignment_status_screen/models/academics_assignment_status_initial_model.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_all_lessons_page/academics_lesson_all_lessons_page.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_all_lessons_page/controller/academics_lesson_all_lessons_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_all_lessons_page/models/academics_lesson_all_lessons_model.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_cbt_test_page/academics_cbt_test_page.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_cbt_test_page/controller/academics_lesson_cbt_test_controller.dart';
import 'package:schulupparent/student/student_presentation/academics_lesson_cbt_test_page/models/academics_lesson_cbt_test_model.dart';
import 'package:schulupparent/student/student_presentation/academics_schular_ai_ongoing_screen/academics_schular_ai_ongoing_screen.dart';
import 'package:schulupparent/student/student_presentation/academics_schular_ai_ongoing_screen/controller/academics_schular_ai_ongoing_controller.dart';
import 'package:schulupparent/student/student_presentation/dashboard_edit_ward_profile/controller/dashboard_edit_ward_profile_controller.dart';
import 'package:schulupparent/student/student_presentation/dashboard_edit_ward_profile/dashboard_edit_ward_profile.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/base64.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/models/models.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/widget/chart_widget.dart';
import 'package:schulupparent/student/student_presentation/dashboard_extended_view/widget/widget.dart';
import 'package:schulupparent/student/student_presentation/direct_chat/direct_chat_screen.dart';
import 'package:schulupparent/student/student_presentation/news_events_screen/controller/news_events_controller.dart';
import 'package:schulupparent/student/student_presentation/news_events_screen/news_events_screen.dart';
import 'package:schulupparent/student/student_presentation/reports_ward_progress_academic_screen/controller/reports_ward_progress_academic_controller.dart';
import 'package:schulupparent/student/student_presentation/reports_ward_progress_academic_screen/reports_ward_progress_academic_screen.dart';
import 'package:schulupparent/student/student_presentation/settings/settings_screen.dart';
import 'package:schulupparent/student/theme/app_decoration.dart';
import 'package:schulupparent/student/theme/custom_text_style.dart';
import 'package:schulupparent/student/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:schulupparent/student/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:schulupparent/student/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:schulupparent/student/widgets/app_bar/custom_app_bar.dart';
import 'package:schulupparent/student/widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:developer' as myLog;
import '../../core/utils/size_utils.dart' hide ResponsiveExtension;

StudentDashboardExtendedViewController controller = Get.put(
  StudentDashboardExtendedViewController(),
);

StudentAcademicsAssignmentStatusController controllerx = Get.put(
  StudentAcademicsAssignmentStatusController(),
);

class DashboardExtendedView extends StatefulWidget {
  const DashboardExtendedView({super.key});

  @override
  State<DashboardExtendedView> createState() => _DashboardExtendedViewState();
}

class _DashboardExtendedViewState extends State<DashboardExtendedView> {
  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  void _onrefresh() {
    //  controller.byGuardian();
  }

  int _currentIndex = 0;
  // bool _isSelected = false;
  // int _selectedStudentIndex = 0;
  // Student? _selectedStudent;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onrefresh,
        child: Container(
          width: double.maxFinite,
          decoration: AppDecoration.grayC13,
          child: Obx(
            () =>
                controller.isLoading.value
                    ? Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFFFF8C42),
                      ),
                    )
                    : Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildColumnacademics(),
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  left: ResponsiveExtension(15).h,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Latest Updates',
                                    style: CustomTextStyles.bodyMediumOnPrimary
                                        .copyWith(fontSize: 16.h),
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),

                              Obx(() {
                                return controller.isLoading.value
                                    ? Center(child: CircularProgressIndicator())
                                    : controller.newsItems.isEmpty
                                    ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          color: Color(0xffFFEED4),
                                        ),
                                        height: 110,
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'Welcome Onboard!!! \nWhat would you love to do today?',
                                            style: CustomTextStyles
                                                .bodyMediumSecondaryContainer
                                                .copyWith(fontSize: 16.h),
                                          ),
                                        ),
                                      ),
                                    )
                                    : SizedBox(
                                      height: 106,
                                      width: double.infinity,
                                      child: CarouselSlider(
                                        items:
                                            controller.newsItems.map((news) {
                                              return Container(
                                                margin: EdgeInsets.all(4),
                                                padding: EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                decoration: AppDecoration
                                                    .primaryC11
                                                    .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder8,
                                                      border: Border.all(
                                                        color: Color(
                                                          0xffFF8D2A,
                                                        ).withValues(alpha: .1),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Colors.grey[100]!,
                                                          offset: Offset(
                                                            0.2,
                                                            0.2,
                                                          ),
                                                          blurRadius: 20,
                                                          spreadRadius: 2,
                                                        ),
                                                      ], //BoxShadow(offset: Offset(1, 1),)
                                                    ),
                                                height: 120,
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      padding: EdgeInsets.all(
                                                        8.h,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Color(
                                                          0xffFFEED4,
                                                        ),

                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CustomImageView(
                                                        imagePath:
                                                            'assets/images/img_icons_small_news.png',
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                            top: 20,
                                                            bottom: 20,
                                                            left: 4,
                                                          ),
                                                      child: Column(
                                                        spacing: 5,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 250,
                                                            child: Text(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              // 'GraceLand PTA Meeting Scheduled for November 15',
                                                              news.title,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                            ),
                                                          ),
                                                          //Spacer(),
                                                          //SizedBox(height: 10,)
                                                          Row(
                                                            children: [
                                                              CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgIconsTinyAttachment,
                                                              ),
                                                              Text(
                                                                //'1 attachment • Monday, Nov. 3, 2025',
                                                                "${news.attachments.length} • ${news.formattedDatePosted}",
                                                                style:
                                                                    CustomTextStyles
                                                                        .bodySmallGray700_1,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),

                                        options: CarouselOptions(
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              _currentIndex = index;
                                            });
                                          },
                                          enlargeCenterPage: true,
                                          aspectRatio: 16 / 5,
                                          height: 150,
                                          viewportFraction: 0.9,
                                          autoPlay: true,
                                        ),
                                      ),
                                    );
                              }),
                              const SizedBox(height: 8),

                              controller.newsItems.isNotEmpty
                                  ? AnimatedSmoothIndicator(
                                    activeIndex: _currentIndex,
                                    count: 3,
                                    effect: ExpandingDotsEffect(
                                      dotHeight: 8,
                                      dotWidth: 8,
                                      activeDotColor: Color(0xffEF5A07),
                                      dotColor: Colors.grey.shade300,
                                    ),
                                  )
                                  : SizedBox.shrink(),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  // vertical: 5,
                                ),
                                child: AcademicProgressChart(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnacademics() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: AppDecoration.primaryC7Main,
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            height: 48.h,
            styleType: Style.bgFillPrimary,
            //centerTitle: true,
            title: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                // height: 150,
                margin: EdgeInsets.only(left: 16),
                padding: EdgeInsets.all(5),
                decoration: AppDecoration.primaryC7Main.copyWith(
                  borderRadius: BorderRadius.circular(12),
                ),
                // decoration: BoxDecoration(
                //   color: Color(0xff27262B),

                //   borderRadius: BorderRadius.circular(12),
                // ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Base64Image(
                          base64String:
                              controller.selectedStudent1.profilePicBase64 ??
                              '?',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                          placeholder: CircleAvatar(
                            backgroundColor: Color(0xFFFF8D2A).withOpacity(0.2),
                            child: Text(
                              controller.selectedStudent1.firstName!
                                      .toUpperCase() ??
                                  '?',
                              style: TextStyle(
                                color: Color(0xFFFF8D2A),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppbarSubtitleFive(
                      text:
                          controller.selectedStudent1.firstName ??
                          "lbl_ogechi".tr,

                      margin: EdgeInsets.only(left: 8.h, right: 9.h),
                    ),
                    // CustomImageView(
                    //   imagePath: ImageConstant.imgChevronDown,
                    //   height: 17,
                    //   width: 17,
                    // ),
                  ],
                ),
              ),
            ),

            // ),
            actions: [
              // AppbarTrailingIconbutton(
              //   onTap: () async {
              //     var token = await studentDataBase.getToken();
              //     print('chat');
              //     // Get.to(() => ChatScreen());
              //     print(token);
              //     //controller.getAcademicSessions();
              //     controller.getClass();
              //   },
              //   imagePath: ImageConstant.imgNotification,
              // ),
              AppbarTrailingIconbutton(
                onTap: () {
                  //Get.toNamed(AppRoutes.directChatScreen);
                  Get.to(() => StudentDirectChatScreen());
                },
                imagePath: ImageConstant.imgLetter,
                margin: EdgeInsets.only(left: 11.h),
              ),
              AppbarTrailingIconbutton(
                onTap: () async {
                  // Get.toNamed(AppRoutes.settingsScreen);
                  Get.to(() => StudentSettingsScreen());
                  // controller.getClass();
                  // controller.getBatch();
                  // var userId = await dataBase.getUserId();
                  // print('User ID from dashboard: $userId');
                  // var token = await dataBase.getToken();
                  // myLog.log('Token from dashboard: $token');
                },
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
              child: AppbarSubtitleOne(
                //   onTap: () => controller.byGuardian(),
                text: "Quick Access",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.maxFinite,
              height: 210,
              child: GridView.builder(
                itemCount: DashboardExtendedViewModel.getSampleList().length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 4,
                  childAspectRatio: 1.2 / 1.5,
                ),
                itemBuilder: (context, index) {
                  DashboardExtendedViewModel model =
                      DashboardExtendedViewModel.getSampleList()[index];
                  return GestureDetector(
                    onTap: () {
                      if (model.route ==
                          '/student_dashboard_editWard_profile_screen') {
                        myLog.log('Navigating to Edit Ward Profile');
                        // Get.delete<
                        //   StudentDashboardEditWardProfileController
                        // >(); // Delete old instance
                        // Get.toNamed(
                        //   model.route!,
                        //   arguments: controller.selectedStudent1,
                        // );
                        Get.to(() => StudentDashboardEditWardProfileScreen());
                      } else if (model.route ==
                          '/student_reports_ward_progress_academic_screen') {
                        myLog.log(
                          'Navigating to reports ward progress academic screen',
                        );
                        Get.to(
                          () => StudentReportsWardProgressAcademicScreen(),
                          binding: BindingsBuilder(() {
                            Get.lazyPut(
                              () =>
                                  StudentReportsWardProgressAcademicController(),
                            );
                          }),
                        );
                      } else if (model.route == '/student_news_events_screen') {
                        Get.to(
                          () => StudentNewsEventsScreen(),
                          binding: BindingsBuilder(() {
                            Get.lazyPut(() => StudentNewsEventsController());
                          }),
                        );
                      } else if (model.route ==
                          "/student_academics_schular_ai_ongoing_screen") {
                        Get.to(
                          () => StudentAcademicsSchularAiOngoingScreen(),
                          binding: BindingsBuilder(() {
                            Get.lazyPut(
                              () =>
                                  StudentAcademicsSchularAiOngoingController(),
                            );
                          }),
                        );
                      } else if (model.route ==
                          '/student_academics_lesson_all_lessons_page') {
                        myLog.log(
                          'Navigating to academics lesson all lessons page',
                        );
                        Get.to(
                          () => StudentAcademicsLessonAllLessonsPage(),
                          binding: BindingsBuilder(() {
                            Get.lazyPut(
                              () => StudentAcademicsLessonAllLessonsController(
                                StudentAcademicsLessonAllLessonsModel().obs,
                              ),
                            );
                          }),
                        );
                      } else if (model.route ==
                          '/student_academics_cbt_test_page') {
                        myLog.log(
                          'Navigating to student academics cbt test page',
                        );
                        Get.to(
                          () => StudentAcademicsCbtTestPage(),
                          binding: BindingsBuilder(() {
                            Get.lazyPut(
                              () => StudentAcademicsLessonCbtTestController(
                                StudentAcademicsLessonCbtTestModel().obs,
                              ),
                            );
                          }),
                        );
                      } else if (model.route ==
                          '/student_academics_assignment_page') {
                        Get.to(
                          () => AcademicsAssignmentPage(),
                          binding: BindingsBuilder(() {
                            Get.lazyPut(
                              () => AcademicsAssignmentController(
                                AcademicsAssignmentModel().obs,
                                // StudentAcademicsLessonCbtTestModel().obs,
                              ),
                            );
                          }),
                        );
                      } else {
                        Get.toNamed(model.route!);
                      }
                    },
                    child: DashboardItemWidget(model),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
