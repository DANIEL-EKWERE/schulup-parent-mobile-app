import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schulupparent/parent/core/app_export.dart';
import 'package:schulupparent/parent/parent_presentation/notification/controller/notification_controller.dart';
import 'package:schulupparent/parent/parent_presentation/notification/model/notification_model.dart';
import 'package:schulupparent/parent/widgets/app_bar/custom_app_bar.dart';
import 'package:schulupparent/parent/core/utils/image_constant.dart';
import 'package:schulupparent/parent/core/utils/size_utils.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/parent/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:schulupparent/parent/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:schulupparent/parent/widgets/app_bar/appbar_subtitle_one.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late DashboardExtendedViewController dashboardExtendedViewController;
  late NotificationController controller;

  @override
  void initState() {
    super.initState();
    dashboardExtendedViewController =
        Get.find<DashboardExtendedViewController>();

    // Clean initialization of controller
    if (Get.isRegistered<NotificationController>()) {
      Get.delete<NotificationController>();
    }
    controller = Get.put(NotificationController());
  }

  @override
  void dispose() {
    // Optional: Clean up controller when leaving screen
    // Get.delete<NotificationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppbar(),
      body: SafeArea(
        top: false,
        child: Obx(() {
          if (controller.isLoading.value && controller.notifications.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: Color(0XFFFF8C42)),
            );
          }

          if (controller.notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 80.h,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No notifications yet',
                    style: TextStyle(
                      fontSize: 18.fSize,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'You\'ll see updates here when they arrive',
                    style: TextStyle(
                      fontSize: 14.fSize,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: controller.refreshNotifications,
            color: Color(0XFFFF8C42),
            child: ListView(
              padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
              children: [
                // Today Section
                if (controller.todayNotifications.isNotEmpty)
                  _buildSection('Today', controller.todayNotifications),

                // Last 7 days Section
                if (controller.last7DaysNotifications.isNotEmpty)
                  _buildSection(
                    'Last 7 days',
                    controller.last7DaysNotifications,
                  ),

                // Last 30 days Section
                if (controller.last30DaysNotifications.isNotEmpty)
                  _buildSection(
                    'Last 30 days',
                    controller.last30DaysNotifications,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSection(String title, List<NotificationItem> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.fSize,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
              letterSpacing: 0.3,
            ),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          itemCount: notifications.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            return _buildNotificationCard(notifications[index]);
          },
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return GestureDetector(
      onTap: () {
        controller.markAsRead(notification.pushNotificationLogID!);
        // Navigate to detail screen if needed
      },
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: notification.isRead ? Colors.white : Color(0xFFFFF4E6),
          borderRadius: BorderRadius.circular(12.h),
          border: Border.all(
            color: notification.isRead ? Colors.grey[200]! : Color(0xFFFFE0B2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Container
            Container(
              padding: EdgeInsets.all(8),
              width: 50.h,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFFEED4),
                //_getIconBackgroundColor(notification.pushActivityType),
                //borderRadius: BorderRadius.circular(12.h),
              ),
              child: Center(
                child:
                //_getIcon(notification.pushActivityType)
                CustomImageView(
                  imagePath: _getIcon(notification.pushActivityType),
                ),
              ),
            ),
            SizedBox(width: 12.h),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          notification.title ?? '',
                          style: TextStyle(
                            fontSize: 14.fSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  if (notification.body != null &&
                      notification.body!.isNotEmpty) ...[
                    SizedBox(height: 6.h),
                    Text(
                      notification.body!,
                      style: TextStyle(
                        fontSize: 13.fSize,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 8.h),
            Text(
              notification.getTimeAgo(),
              style: TextStyle(
                fontSize: 12.fSize,
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconBackgroundColor(String? type) {
    switch (type?.toLowerCase()) {
      case 'attendance':
        return Color(0xFFFFF3CD);
      case 'assignment':
        return Color(0xFFE8F4FD);
      case 'test':
        return Color(0xFFE8F5E9);
      case 'lesson':
        return Color(0xFFF3E5F5);
      case 'report':
        return Color(0xFFE3F2FD);
      case 'news':
        return Color(0xFFFCE4EC);
      default:
        return Color(0xFFF5F5F5);
    }
  }

  String _getIcon(String? type) {
    String image;
    //Color iconColor;

    switch (type?.toLowerCase()) {
      case 'attendance':
        image =
            //'assets/images/img_icons_small_news.png';
            'assets/images/img_icons_small_attendance.png';
        break;
      case 'assignment':
        image = 'assets/images/img_assignments.png';
        break;
      case 'test':
        image = ImageConstant.imgCbttests;
      case 'lesson':
        image = 'assets/images/img_lessons.png';
        break;
      case 'reports':
        image = 'assets/images/img_icons_small_report_card.png';
        break;
      case 'dailyreports':
        image = 'assets/images/img_icons_small_report_card.png';
        break;
      case 'announcement':
        image = 'assets/images/img_icons_small_news.png';
        break;
      case 'event':
        image = ImageConstant.imgEvents;
        break;
      case 'fee':
        image = ImageConstant.imgFees;
        break;
      case 'birthday':
        image = ImageConstant.imgIconsMediumDocument;
        break;
      default:
        image = ImageConstant.imgIconsSmallAttachment;
    }

    return image;
    // Icon(iconData, color: iconColor, size: 24.h);
  }

  /// Section Widget - AppBar
  PreferredSizeWidget _buildAppbar() {
    return CustomAppBar(
      height: 55.h,
      leadingWidth: 65.h,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.h),
        child: Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffEF5A07),
            border: Border.all(color: Color(0xffFFBC71), width: 2),
          ),
          child: AppbarLeadingIconbutton(
            imagePath: ImageConstant.imgArrowLeftWhiteA700,
            onTap: onTapArrowleftone,
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppbarSubtitleOne(text: "Notifications"),
          SizedBox(height: 2.h),
          AppbarSubtitleFive(
            text: dashboardExtendedViewController.selectedStudent1.firstName!,
            margin: EdgeInsets.zero,
          ),
        ],
      ),
      actions: [SizedBox(width: 20.h)],
      styleType: Style.bgFillPrimary,
    );
  }

  void onTapArrowleftone() {
    //Get.back();
    Navigator.pop(context);
  }
}
