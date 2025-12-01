import 'dart:convert';

/// --- Helper Functions ---
DirectMessage directMessageFromJson(String str) =>
    DirectMessage.fromJson(json.decode(str));

String directMessageToJson(DirectMessage data) =>
    json.encode(data.toJson());


/// =============================
/// Direct Message Models
/// =============================
class DirectMessage {
  final bool? success;
  final String? message;
  final Data? data;

  DirectMessage({
    this.success,
    this.message,
    this.data,
  });

  factory DirectMessage.fromJson(Map<String, dynamic> json) {
    return DirectMessage(
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
  final List<Message> messages;

  Data({
    this.totalCount,
    this.page,
    this.pageSize,
    this.totalPages,
    required this.messages,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalCount: json['totalCount'],
      page: json['page'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      messages: json['messages'] != null
          ? List<Message>.from(
              json['messages'].map((v) => Message.fromJson(v)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'totalCount': totalCount,
        'page': page,
        'pageSize': pageSize,
        'totalPages': totalPages,
        'messages': messages.map((v) => v.toJson()).toList(),
      };
}

class Message {
  final int? messageID;
  final int? conversationID;
  final int? senderUserID;
  final int? senderType;
  final String? senderName;
  final String? messageText;
  final String? sentAt;
  final List<Attachment> attachments;

  Message({
    this.messageID,
    this.conversationID,
    this.senderUserID,
    this.senderType,
    this.senderName,
    this.messageText,
    this.sentAt,
    required this.attachments,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageID: json['messageID'],
      conversationID: json['conversationID'],
      senderUserID: json['senderUserID'],
      senderType: json['senderType'],
      senderName: json['senderName'],
      messageText: json['messageText'],
      sentAt: json['sentAt'],
      attachments: json['attachments'] != null
          ? List<Attachment>.from(
              json['attachments'].map((v) => Attachment.fromJson(v)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'messageID': messageID,
        'conversationID': conversationID,
        'senderUserID': senderUserID,
        'senderType': senderType,
        'senderName': senderName,
        'messageText': messageText,
        'sentAt': sentAt,
        'attachments': attachments.map((v) => v.toJson()).toList(),
      };
}

/// Attachment model (you can update this depending on your API)
class Attachment {
  final String? fileName;
  final String? url;
  final String? type;

  Attachment({
    this.fileName,
    this.url,
    this.type,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      fileName: json['fileName'],
      url: json['url'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
        'url': url,
        'type': type,
      };
}
