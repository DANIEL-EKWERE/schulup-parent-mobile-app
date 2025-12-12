import 'dart:convert';

/// --- Helper Functions ---
OngoingConversations ongoingConversationsFromJson(String str) =>
    OngoingConversations.fromJson(json.decode(str));

String ongoingConversationsToJson(OngoingConversations data) =>
    json.encode(data.toJson());


/// =============================
/// Ongoing Conversations Models
/// =============================
class OngoingConversations {
  final bool? success;
  final String? message;
  final Data? data;

  OngoingConversations({
    this.success,
    this.message,
    this.data,
  });

  factory OngoingConversations.fromJson(Map<String, dynamic> json) {
    return OngoingConversations(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}

class Data {
  final int? totalCount;
  final int? page;
  final int? pageSize;
  final int? totalPages;
  final List<Conversations>? conversations;

  Data({
    this.totalCount,
    this.page,
    this.pageSize,
    this.totalPages,
    this.conversations,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalCount: json['totalCount'],
      page: json['page'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      conversations: json['conversations'] != null
          ? List<Conversations>.from(
              json['conversations'].map((v) => Conversations.fromJson(v)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'totalCount': totalCount,
        'page': page,
        'pageSize': pageSize,
        'totalPages': totalPages,
        'conversations': conversations?.map((v) => v.toJson()).toList(),
      };
}

class Conversations {
  final int? conversationID;
  final String? subject;
  final int? createdByID;
  final String? createdByType;
  final String? createdAt;
  final String? lastMessageAt;
  final String? lastMessageText;
  final String? lastMessageSenderName;
  final bool? isActive;

  Conversations({
    this.conversationID,
    this.subject,
    this.createdByID,
    this.createdByType,
    this.createdAt,
    this.lastMessageAt,
    this.lastMessageText,
    this.lastMessageSenderName,
    this.isActive,
  });

  factory Conversations.fromJson(Map<String, dynamic> json) {
    return Conversations(
      conversationID: json['conversationID'],
      subject: json['subject'],
      createdByID: json['createdByID'],
      createdByType: json['createdByType'],
      createdAt: json['createdAt'],
      lastMessageAt: json['lastMessageAt'],
      lastMessageText: json['lastMessageText'],
      lastMessageSenderName: json['lastMessageSenderName'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() => {
        'conversationID': conversationID,
        'subject': subject,
        'createdByID': createdByID,
        'createdByType': createdByType,
        'createdAt': createdAt,
        'lastMessageAt': lastMessageAt,
        'lastMessageText': lastMessageText,
        'lastMessageSenderName': lastMessageSenderName,
        'isActive': isActive,
      };
}
