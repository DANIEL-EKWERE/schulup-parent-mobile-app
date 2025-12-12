import 'dart:convert';

// Top-level helper functions
Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());

class Comments {
  bool? success;
  String? message;
  Data? data;

  Comments({this.success, this.message, this.data});

  Comments.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  // Helper methods
  bool get hasMessages => data?.messages?.isNotEmpty ?? false;
  int get totalMessages => data?.totalCount ?? 0;
  bool get hasMorePages => (data?.page ?? 0) < (data?.totalPages ?? 0);
}

class Data {
  int? totalCount;
  int? page;
  int? pageSize;
  int? totalPages;
  List<Messages>? messages;

  Data({
    this.totalCount,
    this.page,
    this.pageSize,
    this.totalPages,
    this.messages,
  });

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    page = json['page'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = totalCount;
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['totalPages'] = totalPages;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  int? messageID;
  int? conversationID;
  int? senderUserID;
  int? senderType;
  String? senderName;
  String? messageText;
  String? sentAt;
  List<Attachment>? attachments; // ✅ Fixed: Changed from List<Null>

  Messages({
    this.messageID,
    this.conversationID,
    this.senderUserID,
    this.senderType,
    this.senderName,
    this.messageText,
    this.sentAt,
    this.attachments,
  });

  Messages.fromJson(Map<String, dynamic> json) {
    messageID = json['messageID'];
    conversationID = json['conversationID'];
    senderUserID = json['senderUserID'];
    senderType = json['senderType'];
    senderName = json['senderName'];
    messageText = json['messageText'];
    sentAt = json['sentAt'];
    
    // Handle attachments properly
    if (json['attachments'] != null) {
      attachments = <Attachment>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['messageID'] = messageID;
    data['conversationID'] = conversationID;
    data['senderUserID'] = senderUserID;
    data['senderType'] = senderType;
    data['senderName'] = senderName;
    data['messageText'] = messageText;
    data['sentAt'] = sentAt;
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Helper methods
  DateTime? get sentAtDateTime {
    if (sentAt == null) return null;
    try {
      return DateTime.parse(sentAt!);
    } catch (e) {
      return null;
    }
  }

  String get formattedTime {
    final dateTime = sentAtDateTime;
    if (dateTime == null) return '';
    
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays == 0) {
      // Today - show time
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  bool get hasAttachments => attachments?.isNotEmpty ?? false;
  bool get isMyMessage => senderType == 1; // Adjust based on your logic
}

// Attachment model (if attachments have structure)
class Attachment {
  String? url;
  String? type;
  String? name;
  int? size;

  Attachment({this.url, this.type, this.name, this.size});

  Attachment.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
    name = json['name'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'type': type,
      'name': name,
      'size': size,
    };
  }
}
