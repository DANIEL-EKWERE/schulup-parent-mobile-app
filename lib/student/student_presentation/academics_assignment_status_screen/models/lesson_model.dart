import 'dart:convert';
import 'package:intl/intl.dart';

Lesson lessonFromJson(String str) =>
    Lesson.fromJson(json.decode(str));

String lessonToJson(Lesson data) =>
    json.encode(data.toJson());

class Lesson {
  bool? success;
  String? message;
  List<StudentLessonData>? data;
  Pagination? pagination;

  Lesson({
    this.success,
    this.message,
    this.data,
    this.pagination,
  });

  Lesson.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StudentLessonData>[];
      json['data'].forEach((v) {
        data!.add(StudentLessonData.fromJson(v));
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

class StudentLessonData {
  int? id;
  String? title;
  String? lessonContent;
  String? lessonContentHtml;
  String? subjectMasterName;
  String? lastUpdated;
  List<LessonAttachment>? attachments;

  StudentLessonData({
    this.id,
    this.title,
    this.lessonContent,
    this.lessonContentHtml,
    this.subjectMasterName,
    this.lastUpdated,
    this.attachments,
  });

  // Helper method to format lastUpdated date
  String get formattedLastUpdated {
    if (lastUpdated == null) return '';
    try {
      DateTime dateTime = DateTime.parse(lastUpdated!);
      return DateFormat('EEEE, MMM. d, yyyy').format(dateTime);
    } catch (e) {
      return lastUpdated ?? '';
    }
  }

  StudentLessonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lessonContent = json['lessonContent'];
    lessonContentHtml = json['lessonContentHtml'];
    subjectMasterName = json['subjectMasterName'];
    lastUpdated = json['lastUpdated'];
    if (json['attachments'] != null) {
      attachments = <LessonAttachment>[];
      json['attachments'].forEach((v) {
        attachments!.add(LessonAttachment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['lessonContent'] = lessonContent;
    data['lessonContentHtml'] = lessonContentHtml;
    data['subjectMasterName'] = subjectMasterName;
    data['lastUpdated'] = lastUpdated;
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LessonAttachment {
  String? fileName;
  String? fileUrl;
  String? fileType;
  int? fileSize;

  LessonAttachment({
    this.fileName,
    this.fileUrl,
    this.fileType,
    this.fileSize,
  });

  LessonAttachment.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
    fileType = json['fileType'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['fileUrl'] = fileUrl;
    data['fileType'] = fileType;
    data['fileSize'] = fileSize;
    return data;
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