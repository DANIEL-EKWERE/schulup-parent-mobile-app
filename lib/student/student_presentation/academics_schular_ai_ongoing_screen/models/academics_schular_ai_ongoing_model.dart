// TODO Implement this library.
import '../../../core/app_export.dart';

/// This class defines the variables used in the [academics_schular_ai_ongoing_screen],
/// and is typically used to hold data that is passed between different parts of the application.
// class AcademicsSchularAiOngoingModel {

// }
import 'dart:convert';
import 'package:intl/intl.dart';

AcademicsSchularAiOngoingModel scholarAiFromJson(String str) =>
    AcademicsSchularAiOngoingModel.fromJson(json.decode(str));

String scholarAiToJson(AcademicsSchularAiOngoingModel data) =>
    json.encode(data.toJson());

class AcademicsSchularAiOngoingModel {
  bool? success;
  String? message;
  List<ChatData>? data;
  Pagination? pagination;

  AcademicsSchularAiOngoingModel({
    this.success,
    this.message,
    this.data,
    this.pagination,
  });

  AcademicsSchularAiOngoingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ChatData>[];
      json['data'].forEach((v) {
        data!.add(ChatData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }

  // Helper method to get all user messages
  List<ChatData> get userMessages {
    return data?.where((msg) => msg.isAiResponse == false).toList() ?? [];
  }

  // Helper method to get all AI responses
  List<ChatData> get aiMessages {
    return data?.where((msg) => msg.isAiResponse == true).toList() ?? [];
  }

  // Helper method to get total message count
  int get totalMessages {
    return data?.length ?? 0;
  }

  // Helper method to check if there are any messages
  bool get hasMessages {
    return data != null && data!.isNotEmpty;
  }

  // Copy method
  AcademicsSchularAiOngoingModel copyWith({
    bool? success,
    String? message,
    List<ChatData>? data,
    Pagination? pagination,
  }) {
    return AcademicsSchularAiOngoingModel(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }
}

class ChatData {
  int? id;
  int? studentID;
  String? names;
  String? response;
  String? timestamp;
  String? timestampString;
  bool? isAiResponse;

  ChatData({
    this.id,
    this.studentID,
    this.names,
    this.response,
    this.timestamp,
    this.timestampString,
    this.isAiResponse,
  });

  ChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentID = json['studentID'];
    names = json['names'];
    response = json['response'];
    timestamp = json['timestamp'];
    timestampString = json['timestampString'];
    isAiResponse = json['isAiResponse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['studentID'] = studentID;
    data['names'] = names;
    data['response'] = response;
    data['timestamp'] = timestamp;
    data['timestampString'] = timestampString;
    data['isAiResponse'] = isAiResponse;
    return data;
  }

  // Helper method to format timestamp
  String get formattedTimestamp {
    if (timestamp == null) return timestampString ?? '';
    try {
      DateTime dateTime = DateTime.parse(timestamp!);
      return DateFormat('MMM d, yyyy - h:mm a').format(dateTime);
    } catch (e) {
      return timestampString ?? '';
    }
  }

  // Helper method to get short time format
  String get shortTimeFormat {
    if (timestamp == null) return timestampString ?? '';
    try {
      DateTime dateTime = DateTime.parse(timestamp!);
      return DateFormat('h:mm a').format(dateTime);
    } catch (e) {
      return timestampString ?? '';
    }
  }

  // Helper method to get relative time (e.g., "2 hours ago")
  String get relativeTime {
    if (timestamp == null) return timestampString ?? '';
    try {
      DateTime dateTime = DateTime.parse(timestamp!);
      DateTime now = DateTime.now();
      Duration difference = now.difference(dateTime);

      if (difference.inSeconds < 60) {
        return 'Just now';
      } else if (difference.inMinutes < 60) {
        int minutes = difference.inMinutes;
        return '$minutes min${minutes == 1 ? '' : 's'} ago';
      } else if (difference.inHours < 24) {
        int hours = difference.inHours;
        return '$hours hour${hours == 1 ? '' : 's'} ago';
      } else if (difference.inDays < 7) {
        int days = difference.inDays;
        return '$days day${days == 1 ? '' : 's'} ago';
      } else if (difference.inDays < 30) {
        int weeks = (difference.inDays / 7).floor();
        return '$weeks week${weeks == 1 ? '' : 's'} ago';
      } else if (difference.inDays < 365) {
        int months = (difference.inDays / 30).floor();
        return '$months month${months == 1 ? '' : 's'} ago';
      } else {
        int years = (difference.inDays / 365).floor();
        return '$years year${years == 1 ? '' : 's'} ago';
      }
    } catch (e) {
      return timestampString ?? '';
    }
  }

  // Helper method to get user initials
  String get userInitials {
    if (names == null || names!.isEmpty) return 'AI';
    if (isAiResponse == true) return 'AI';
    
    List<String> namesList = names!.trim().split(' ');
    if (namesList.length == 1) {
      return namesList[0][0].toUpperCase();
    }
    return '${namesList.first[0]}${namesList.last[0]}'.toUpperCase();
  }

  // Helper method to get sender type
  String get senderType {
    return isAiResponse == true ? 'AI' : 'User';
  }

  // Helper method to check if message is from user
  bool get isUserMessage {
    return isAiResponse == false;
  }

  // Helper method to get response preview (first 100 characters)
  String get responsePreview {
    if (response == null) return '';
    if (response!.length <= 100) return response!;
    return '${response!.substring(0, 100)}...';
  }

  // Helper method to get response word count
  int get wordCount {
    if (response == null || response!.isEmpty) return 0;
    return response!.trim().split(RegExp(r'\s+')).length;
  }

  // Helper method to check if response is long (more than 50 words)
  bool get isLongResponse {
    return wordCount > 50;
  }

  // Helper method to check if message is recent (within 1 hour)
  bool get isRecent {
    if (timestamp == null) return false;
    try {
      DateTime dateTime = DateTime.parse(timestamp!);
      DateTime now = DateTime.now();
      Duration difference = now.difference(dateTime);
      return difference.inHours < 1;
    } catch (e) {
      return false;
    }
  }

  // Helper method to check if message is today
  bool get isToday {
    if (timestamp == null) return false;
    try {
      DateTime dateTime = DateTime.parse(timestamp!);
      DateTime now = DateTime.now();
      return dateTime.year == now.year &&
             dateTime.month == now.month &&
             dateTime.day == now.day;
    } catch (e) {
      return false;
    }
  }

  // Helper method to get date header text
  String get dateHeader {
    if (timestamp == null) return '';
    try {
      DateTime dateTime = DateTime.parse(timestamp!);
      DateTime now = DateTime.now();
      
      if (isToday) {
        return 'Today';
      } else if (dateTime.year == now.year &&
                 dateTime.month == now.month &&
                 dateTime.day == now.day - 1) {
        return 'Yesterday';
      } else if (dateTime.isAfter(now.subtract(const Duration(days: 7)))) {
        return DateFormat('EEEE').format(dateTime); // Day name
      } else {
        return DateFormat('MMM d, yyyy').format(dateTime);
      }
    } catch (e) {
      return '';
    }
  }

  // Helper method to get display name
  String get displayName {
    if (isAiResponse == true) return 'Scholar AI';
    return names ?? 'User';
  }

  // Copy method
  ChatData copyWith({
    int? id,
    int? studentID,
    String? names,
    String? response,
    String? timestamp,
    String? timestampString,
    bool? isAiResponse,
  }) {
    return ChatData(
      id: id ?? this.id,
      studentID: studentID ?? this.studentID,
      names: names ?? this.names,
      response: response ?? this.response,
      timestamp: timestamp ?? this.timestamp,
      timestampString: timestampString ?? this.timestampString,
      isAiResponse: isAiResponse ?? this.isAiResponse,
    );
  }
}

class Pagination {
  int? currentPage;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Pagination({
    this.currentPage,
    this.pageSize,
    this.totalCount,
    this.totalPages,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['pageSize'] = pageSize;
    data['totalCount'] = totalCount;
    data['totalPages'] = totalPages;
    data['hasNextPage'] = hasNextPage;
    data['hasPreviousPage'] = hasPreviousPage;
    return data;
  }

  // Helper method to get page range text
  String get pageRangeText {
    if (currentPage == null || pageSize == null || totalCount == null) return '';
    
    int start = ((currentPage! - 1) * pageSize!) + 1;
    int end = start + pageSize! - 1;
    if (end > totalCount!) end = totalCount!;
    
    return '$start-$end of $totalCount';
  }

  // Helper method to check if on first page
  bool get isFirstPage {
    return currentPage == 1 || hasPreviousPage == false;
  }

  // Helper method to check if on last page
  bool get isLastPage {
    return currentPage == totalPages || hasNextPage == false;
  }

  // Helper method to get progress percentage
  double get progressPercentage {
    if (totalPages == null || currentPage == null || totalPages == 0) return 0.0;
    return (currentPage! / totalPages!) * 100;
  }

  // Copy method
  Pagination copyWith({
    int? currentPage,
    int? pageSize,
    int? totalCount,
    int? totalPages,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      totalCount: totalCount ?? this.totalCount,
      totalPages: totalPages ?? this.totalPages,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
    );
  }
}
