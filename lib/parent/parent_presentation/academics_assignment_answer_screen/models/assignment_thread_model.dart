import 'dart:convert';

// Top-level helper functions
AssignmentThread assignmentThreadFromJson(String str) =>
    AssignmentThread.fromJson(json.decode(str));
String assignmentThreadToJson(AssignmentThread data) =>
    json.encode(data.toJson());

class AssignmentThread {
  bool? success;
  String? message;
  Data? data;

  AssignmentThread({this.success, this.message, this.data});

  AssignmentThread.fromJson(Map<String, dynamic> json) {
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
  bool get hasReplies => data?.replies?.isNotEmpty ?? false;
  int get totalReplies => data?.replies?.length ?? 0;
}

class Data {
  int? assignmentThreadID;
  int? assignmentID;
  int? teacherUserID;
  String? teacherName;
  int? studentUserID;
  String? studentName;
  String? dateCreated;
  List<Replies>? replies;

  Data({
    this.assignmentThreadID,
    this.assignmentID,
    this.teacherUserID,
    this.teacherName,
    this.studentUserID,
    this.studentName,
    this.dateCreated,
    this.replies,
  });

  Data.fromJson(Map<String, dynamic> json) {
    assignmentThreadID = json['assignmentThreadID'];
    assignmentID = json['assignmentID'];
    teacherUserID = json['teacherUserID'];
    teacherName = json['teacherName'];
    studentUserID = json['studentUserID'];
    studentName = json['studentName'];
    dateCreated = json['dateCreated'];
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies!.add(Replies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['assignmentThreadID'] = assignmentThreadID;
    data['assignmentID'] = assignmentID;
    data['teacherUserID'] = teacherUserID;
    data['teacherName'] = teacherName;
    data['studentUserID'] = studentUserID;
    data['studentName'] = studentName;
    data['dateCreated'] = dateCreated;
    if (replies != null) {
      data['replies'] = replies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Helper methods
  DateTime? get dateCreatedDateTime {
    if (dateCreated == null) return null;
    try {
      return DateTime.parse(dateCreated!);
    } catch (e) {
      return null;
    }
  }
}

class Replies {
  int? assignmentThreadReplyID;
  int? threadID;
  int? userID;
  String? userName;
  bool? isStudent;
  String? replyText;
  String? replyDate;
  bool? isRead;
  List<Attachment>? attachments;

  Replies({
    this.assignmentThreadReplyID,
    this.threadID,
    this.userID,
    this.userName,
    this.isStudent,
    this.replyText,
    this.replyDate,
    this.isRead,
    this.attachments,
  });

  Replies.fromJson(Map<String, dynamic> json) {
    assignmentThreadReplyID = json['assignmentThreadReplyID'];
    threadID = json['threadID'];
    userID = json['userID'];
    userName = json['userName'];
    isStudent = json['isStudent'];
    replyText = json['replyText'];
    replyDate = json['replyDate'];
    isRead = json['isRead'];

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
    data['assignmentThreadReplyID'] = assignmentThreadReplyID;
    data['threadID'] = threadID;
    data['userID'] = userID;
    data['userName'] = userName;
    data['isStudent'] = isStudent;
    data['replyText'] = replyText;
    data['replyDate'] = replyDate;
    data['isRead'] = isRead;
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Helper methods
  DateTime? get replyDateTime {
    if (replyDate == null) return null;
    try {
      return DateTime.parse(replyDate!);
    } catch (e) {
      return null;
    }
  }

  String get formattedTime {
    final dateTime = replyDateTime;
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
  bool get isStudentReply => isStudent ?? false;
  bool get isTeacherReply => !(isStudent ?? true);
}

// Attachment model
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

  // Helper methods
  bool get isImage =>
      type?.toLowerCase().contains('image') ?? 
      url?.toLowerCase().endsWith('.jpg') ?? 
      url?.toLowerCase().endsWith('.png') ?? 
      false;
  
  bool get isPdf => type?.toLowerCase().contains('pdf') ?? false;
  
  String get displaySize {
    if (size == null) return '';
    if (size! < 1024) return '$size B';
    if (size! < 1024 * 1024) return '${(size! / 1024).toStringAsFixed(1)} KB';
    return '${(size! / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}