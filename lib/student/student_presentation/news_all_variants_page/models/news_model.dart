import 'dart:convert';

import 'package:intl/intl.dart';

NewsResponse newsResponseFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) =>
    json.encode(data.toJson());



class NewsResponse {
  final bool success;
  final String message;
  final NewsData data;

  NewsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: NewsData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class NewsData {
  final int totalCount;
  final int page;
  final int pageSize;
  final int totalPages;
  final List<NewsItem> news;

  NewsData({
    required this.totalCount,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    required this.news,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      totalCount: json['totalCount'] ?? 0,
      page: json['page'] ?? 1,
      pageSize: json['pageSize'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      news: (json['news'] as List? ?? [])
          .map((e) => NewsItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalCount': totalCount,
      'page': page,
      'pageSize': pageSize,
      'totalPages': totalPages,
      'news': news.map((e) => e.toJson()).toList(),
    };
  }
}

class NewsItem {
  final int id;
  final String title;
  final String content;
  final String contentHtml;
  final String contentPreview;
  final String category;
  final String createdAt; // Stored as String because you prefer string-based dates
  final List<Attachment> attachments;

  NewsItem({
    required this.id,
    required this.title,
    required this.content,
    required this.contentHtml,
    required this.contentPreview,
    required this.category,
    required this.createdAt,
    required this.attachments,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      contentHtml: json['contentHtml'] ?? '',
      contentPreview: json['contentPreview'] ?? '',
      category: json['category'] ?? '',
      createdAt: json['createdAt'] ?? '',
      attachments: (json['attachments'] as List? ?? [])
          .map((e) => Attachment.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'contentHtml': contentHtml,
      'contentPreview': contentPreview,
      'category': category,
      'createdAt': createdAt,
      'attachments': attachments.map((e) => e.toJson()).toList(),
    };
  }



  // Helper method to format date posted
  String get formattedDatePosted {
    if (createdAt == null) return '';
    try {
      DateTime dateTime = DateTime.parse(createdAt);
      return DateFormat('MMM d, yyyy').format(dateTime);
    } catch (e) {
      return createdAt ?? '';
    }
  }
}

class Attachment {
  final String fileNameAndExtention;
  final String downloadUrl;
  final String fileIcon;

  Attachment({
    required this.fileNameAndExtention,
    required this.downloadUrl,
    required this.fileIcon,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      fileNameAndExtention: json['fileNameAndExtention'] ?? '',
      downloadUrl: json['downloadUrl'] ?? '',
      fileIcon: json['fileIcon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileNameAndExtention': fileNameAndExtention,
      'downloadUrl': downloadUrl,
      'fileIcon': fileIcon,
    };
  }

  

  
}
