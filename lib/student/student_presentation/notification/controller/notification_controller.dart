// lib/controllers/notification_controller.dart
import 'dart:convert';
import 'package:get/get.dart';
//import 'package:schulupparent/models/notification_model.dart';
// import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'dart:developer' as myLog;

import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/notification/model/notification_model.dart';



class NotificationController extends GetxController {
  final ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  // Observable variables
  var isLoading = false.obs;
  var notifications = <NotificationItem>[].obs;

  // Grouped notifications
  var todayNotifications = <NotificationItem>[].obs;
  var last7DaysNotifications = <NotificationItem>[].obs;
  var last30DaysNotifications = <NotificationItem>[].obs;

  // Pagination
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var totalCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  // Fetch notifications from API
  Future<void> fetchNotifications({int page = 1}) async {
    try {
      isLoading.value = true;

      final response = await _apiService.getNotifications(page);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = jsonDecode(response.body);
        NotificationResponse notificationResponse =
            NotificationResponse.fromJson(responseData);

        if (notificationResponse.data != null) {
          notifications.value = notificationResponse.data!.notifications ?? [];
          totalCount.value = notificationResponse.data!.totalCount ?? 0;
          totalPages.value = notificationResponse.data!.totalPages ?? 1;
          currentPage.value = page;

          // Group notifications
          _groupNotifications();
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to load notifications',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      myLog.log('Error fetching notifications: $e');
      Get.snackbar(
        'Error',
        'Something went wrong',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Group notifications by time period
  void _groupNotifications() {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime last7Days = now.subtract(Duration(days: 7));
    DateTime last30Days = now.subtract(Duration(days: 30));

    todayNotifications.clear();
    last7DaysNotifications.clear();
    last30DaysNotifications.clear();

    for (var notification in notifications) {
      if (notification.sentAt != null) {
        DateTime sentDate = DateTime.parse(notification.sentAt!);

        if (sentDate.isAfter(todayStart)) {
          todayNotifications.add(notification);
        } else if (sentDate.isAfter(last7Days)) {
          last7DaysNotifications.add(notification);
        } else if (sentDate.isAfter(last30Days)) {
          last30DaysNotifications.add(notification);
        }
      }
    }
  }

  // Mark notification as read
  Future<void> markAsRead(int notificationId) async {
    try {
      // Call your API to mark as read
      final response = await _apiService.markNotificationAsRead(notificationId);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Update local state
        var index = notifications.indexWhere(
          (notification) =>
              notification.pushNotificationLogID == notificationId,
        );
        if (index != -1) {
          notifications[index].readAt = DateTime.now().toIso8601String();
          notifications.refresh();
          _groupNotifications(); // Regroup notifications after update
        }
      } else {
        myLog.log(
          'Failed to mark notification as read. Status code: ${response.statusCode} ${response.body}',
        );
        Get.snackbar(
          'Error',
          'Failed to mark notification as read',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      myLog.log('Error marking notification as read: $e');
    }
  }

  // Refresh notifications
  Future<void> refreshNotifications() async {
    await fetchNotifications(page: 1);
  }

  // Load more notifications (pagination)
  Future<void> loadMore() async {
    if (currentPage.value < totalPages.value) {
      await fetchNotifications(page: currentPage.value + 1);
    }
  }
}
