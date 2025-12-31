// lib/models/notification_model.dart
class NotificationResponse {
  bool? success;
  String? message;
  NotificationData? data;

  NotificationResponse({this.success, this.message, this.data});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? NotificationData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NotificationData {
  int? totalCount;
  int? page;
  int? pageSize;
  int? totalPages;
  List<NotificationItem>? notifications;

  NotificationData({
    this.totalCount,
    this.page,
    this.pageSize,
    this.totalPages,
    this.notifications,
  });

  NotificationData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    page = json['page'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    if (json['notifications'] != null) {
      notifications = <NotificationItem>[];
      json['notifications'].forEach((v) {
        notifications!.add(NotificationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['totalPages'] = totalPages;
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationItem {
  int? pushNotificationLogID;
  String? title;
  String? body;
  String? status;
  String? platform;
  String? queuedAt;
  String? sentAt;
  String? readAt;
  String? pushActivityType;

  NotificationItem({
    this.pushNotificationLogID,
    this.title,
    this.body,
    this.status,
    this.platform,
    this.queuedAt,
    this.sentAt,
    this.readAt,
    this.pushActivityType,
  });

  NotificationItem.fromJson(Map<String, dynamic> json) {
    pushNotificationLogID = json['pushNotificationLogID'];
    title = json['title'];
    body = json['body'];
    status = json['status'];
    platform = json['platform'];
    queuedAt = json['queuedAt'];
    sentAt = json['sentAt'];
    readAt = json['readAt'];
    pushActivityType = json['pushActivityType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pushNotificationLogID'] = pushNotificationLogID;
    data['title'] = title;
    data['body'] = body;
    data['status'] = status;
    data['platform'] = platform;
    data['queuedAt'] = queuedAt;
    data['sentAt'] = sentAt;
    data['readAt'] = readAt;
    data['pushActivityType'] = pushActivityType;
    return data;
  }

  // Helper method to check if notification is read
  bool get isRead => readAt != null;

  // Helper method to get time ago
  String getTimeAgo() {
    if (sentAt == null) return '';
    
    DateTime sentDate = DateTime.parse(sentAt!);
    Duration difference = DateTime.now().difference(sentDate);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${(difference.inDays / 7).floor()}w ago';
    }
  }

  // Get notification icon based on type
  String getIconPath() {
    switch (pushActivityType?.toLowerCase()) {
      case 'attendance':
        return '🔔'; // or your actual icon path
      case 'assignment':
        return '📄';
      case 'test':
        return '📺';
      case 'lesson':
        return '📚';
      case 'report':
        return '📧';
      case 'news':
        return '📝';
      default:
        return '🔔';
    }
  }
}