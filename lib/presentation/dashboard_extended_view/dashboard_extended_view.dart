import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:schulupparent/core/app_export.dart';
import 'package:schulupparent/core/utils/image_constant.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/models/models.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/widget/chart_widget.dart';
import 'package:schulupparent/presentation/dashboard_extended_view/widget/widget.dart';
import 'package:schulupparent/theme/app_decoration.dart';
import 'package:schulupparent/theme/custom_text_style.dart';
import 'package:schulupparent/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:schulupparent/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:schulupparent/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:schulupparent/widgets/app_bar/custom_app_bar.dart';
import 'package:schulupparent/widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  int _currentIndex = 0;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        decoration: AppDecoration.grayC13,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildColumnacademics(),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 10.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Latest Updates',
                        style: CustomTextStyles.bodyMediumOnPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 109,
                    width: double.infinity,
                    child: CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.only(left: 10),
                          decoration: AppDecoration.primaryC11.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                            border: Border.all(
                              color: Color(0xffFF8D2A).withValues(alpha: .1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100]!,
                                offset: Offset(0.2, 0.2),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ], //BoxShadow(offset: Offset(1, 1),)
                          ),
                          height: 150,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.all(8.h),
                                decoration: BoxDecoration(
                                  color: Color(0xffFFEED4),

                                  shape: BoxShape.circle,
                                ),
                                child: CustomImageView(
                                  imagePath:
                                      'assets/images/img_icons_small_news.png',
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                  bottom: 20,
                                  left: 4,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        'GraceLand PTA Meeting Scheduled for November 15',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant
                                                  .imgIconsTinyAttachment,
                                        ),
                                        Text(
                                          '1 attachment • Monday, Nov. 3, 2025',
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
                        ),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 17.h,
                          ),
                          decoration: AppDecoration.primaryC11.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder12,
                            // borderRadius: BorderRadiusStyle.roundedBorder8,
                            border: Border.all(
                              color: Color(0xffFF8D2A).withValues(alpha: .1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100]!,
                                offset: Offset(0.2, 0.2),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            spacing: 10,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.h),
                                    width: 40.h,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFEED4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgAssignments,
                                      height: 20.h,
                                      width: 20.h,
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  Column(
                                    spacing: 15.h,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 0.h),
                                        child:
                                        // Obx(
                                        //   () =>
                                        Text(
                                          'Word Problems',
                                          style: CustomTextStyles
                                              .titleMediumOnPrimary
                                              .copyWith(fontSize: 14.h),
                                          //theme.textTheme.bodyLarge,
                                        ),
                                        //   ),
                                      ),
                                      // Obx(
                                      //   () =>
                                      Text(
                                        'Mathematics • Posted on Nov. 3, 2025',
                                        style:
                                            CustomTextStyles
                                                .bodySmallSecondaryContainer10,
                                      ),
                                      //  ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6.h,
                                          vertical: 2.h,
                                        ),
                                        decoration: AppDecoration.grayC7
                                            .copyWith(
                                              borderRadius:
                                                  BorderRadiusStyle
                                                      .roundedBorder8,
                                            ),
                                        child:
                                        // Obx(
                                        //   () =>
                                        Text(
                                          'Due on Nov. 5, 2025',
                                          textAlign: TextAlign.center,
                                          style:
                                              CustomTextStyles
                                                  .bodySmallWhiteA700,
                                        ),
                                        // ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffFFEED4),
                          ),
                          height: 180,
                          width: double.infinity,
                        ),
                      ],
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
                  ),
                  const SizedBox(height: 8),

                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Color(0xffEF5A07),
                      dotColor: Colors.grey.shade300,
                    ),
                  ),
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
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor:
                      Colors.transparent, // optional for rounded corners
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 5,
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          Text(
                            "Swhitch Ward",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 20),

                          // Text(
                          //   "Your content goes here...",
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontSize: 14,
                          //     color: Colors.black54,
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/ward_image.png',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('Ogechi'),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isSelected = !_isSelected; // toggle
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            _isSelected
                                                ? Color(0xFFFF8D2A)
                                                : Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child:
                                        _isSelected
                                            ? Center(
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFFF8D2A),
                                                ),
                                              ),
                                            )
                                            : SizedBox.shrink(),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/fatima.png',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('Fatima'),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isSelected = !_isSelected; // toggle
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            _isSelected
                                                ? Color(0xFFFF8D2A)
                                                : Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child:
                                        _isSelected
                                            ? Center(
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFFF8D2A),
                                                ),
                                              ),
                                            )
                                            : SizedBox.shrink(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/adebayo.png',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('Adebayo'),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isSelected = !_isSelected; // toggle
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            _isSelected
                                                ? Color(0xFFFF8D2A)
                                                : Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                    child:
                                        _isSelected
                                            ? Center(
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFFF8D2A),
                                                ),
                                              ),
                                            )
                                            : SizedBox.shrink(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: 105,
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
            ),

            // ),
            actions: [
              AppbarTrailingIconbutton(
                imagePath: ImageConstant.imgNotification,
              ),
              AppbarTrailingIconbutton(
                onTap: () {
                  Get.toNamed(AppRoutes.directChatScreen);
                },
                imagePath: ImageConstant.imgLetter,
                margin: EdgeInsets.only(left: 11.h),
              ),
              AppbarTrailingIconbutton(
                onTap: () {
                  Get.toNamed(AppRoutes.settingsScreen);
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
              child: AppbarSubtitleOne(text: "Quick Access"),
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
                    onTap: () => Get.toNamed(model.route!),
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
