import 'dart:convert';
import 'package:intl/intl.dart';

Assignment assignmentFromJson(String str) =>
    Assignment.fromJson(json.decode(str));

String assignmentToJson(Assignment data) =>
    json.encode(data.toJson());

class Assignment {
  bool? success;
  String? message;
  List<AssignmentData>? data;
  Pagination? pagination;

  Assignment({
    this.success,
    this.message,
    this.data,
    this.pagination,
  });

  Assignment.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AssignmentData>[];
      json['data'].forEach((v) {
        data!.add(AssignmentData.fromJson(v));
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
}

class AssignmentData {
  int? assignmentID;
  String? title;
  String? content;
  String? teachersName;
  String? className;
  String? subjectName;
  String? datePosted;
  String? dueDate;

  AssignmentData({
    this.assignmentID,
    this.title,
    this.content,
    this.teachersName,
    this.className,
    this.subjectName,
    this.datePosted,
    this.dueDate,
  });

  AssignmentData.fromJson(Map<String, dynamic> json) {
    assignmentID = json['assignmentID'];
    title = json['title'];
    content = json['content'];
    teachersName = json['teachersName'];
    className = json['className'];
    subjectName = json['subjectName'];
    datePosted = json['datePosted'];
    dueDate = json['dueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assignmentID'] = assignmentID;
    data['title'] = title;
    data['content'] = content;
    data['teachersName'] = teachersName;
    data['className'] = className;
    data['subjectName'] = subjectName;
    data['datePosted'] = datePosted;
    data['dueDate'] = dueDate;
    return data;
  }

  // Helper method to format date posted
  String get formattedDatePosted {
    if (datePosted == null) return '';
    try {
      DateTime dateTime = DateTime.parse(datePosted!);
      return DateFormat('MMM d, yyyy').format(dateTime);
    } catch (e) {
      return datePosted ?? '';
    }
  }

  // Helper method to format due date
  String get formattedDueDate {
    if (dueDate == null) return '';
    try {
      DateTime dateTime = DateTime.parse(dueDate!);
      return DateFormat('MMM d, yyyy').format(dateTime);
    } catch (e) {
      return dueDate ?? '';
    }
  }

  // Helper method to get due date with day name
  String get formattedDueDateWithDay {
    if (dueDate == null) return '';
    try {
      DateTime dateTime = DateTime.parse(dueDate!);
      return DateFormat('EEEE, MMM d, yyyy').format(dateTime);
    } catch (e) {
      return dueDate ?? '';
    }
  }

  // Helper method to check if assignment is overdue
  bool get isOverdue {
    if (dueDate == null) return false;
    try {
      DateTime dueDatetime = DateTime.parse(dueDate!);
      return DateTime.now().isAfter(dueDatetime);
    } catch (e) {
      return false;
    }
  }

  // Helper method to check if assignment is due today
  bool get isDueToday {
    if (dueDate == null) return false;
    try {
      DateTime dueDatetime = DateTime.parse(dueDate!);
      DateTime now = DateTime.now();
      return dueDatetime.year == now.year &&
             dueDatetime.month == now.month &&
             dueDatetime.day == now.day;
    } catch (e) {
      return false;
    }
  }

  // Helper method to check if assignment is due soon (within 3 days)
  bool get isDueSoon {
    if (dueDate == null) return false;
    try {
      DateTime dueDatetime = DateTime.parse(dueDate!);
      DateTime now = DateTime.now();
      Duration difference = dueDatetime.difference(now);
      return difference.inDays >= 0 && difference.inDays <= 3;
    } catch (e) {
      return false;
    }
  }

  // Helper method to get days until due
  int? get daysUntilDue {
    if (dueDate == null) return null;
    try {
      DateTime dueDatetime = DateTime.parse(dueDate!);
      DateTime now = DateTime.now();
      return dueDatetime.difference(now).inDays;
    } catch (e) {
      return null;
    }
  }

  // Helper method to get days until due text
  String get daysUntilDueText {
    int? days = daysUntilDue;
    if (days == null) return '';
    
    if (days < 0) {
      return '${days.abs()} day${days.abs() == 1 ? '' : 's'} overdue';
    } else if (days == 0) {
      return 'Due today';
    } else if (days == 1) {
      return 'Due tomorrow';
    } else {
      return 'Due in $days days';
    }
  }

  // Helper method to get status color based on due date
  String get statusColor {
    if (isOverdue) return 'red';
    if (isDueToday) return 'orange';
    if (isDueSoon) return 'yellow';
    return 'green';
  }

  // Helper method to get teacher initials
  String get teacherInitials {
    if (teachersName == null || teachersName!.isEmpty) return '?';
    List<String> names = teachersName!.trim().split(' ');
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }

  // Helper method to get assignment summary
  String get summary {
    if (content == null) return '';
    if (content!.length <= 100) return content!;
    return '${content!.substring(0, 100)}...';
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
}