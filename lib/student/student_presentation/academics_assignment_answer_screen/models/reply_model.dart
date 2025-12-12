import 'dart:convert';
import 'package:intl/intl.dart';

StudentReply studentReplyFromJson(String str) =>
    StudentReply.fromJson(json.decode(str));

String studentReplyToJson(StudentReply data) =>
    json.encode(data.toJson());

class StudentReply {
  int? assignmentThreadReplyID;
  int? threadID;
  int? userID;
  String? userName;
  bool? isStudent;
  String? replyText;
  String? replyDate;
  bool? isRead;
  List<Attachment>? attachments;

  StudentReply({
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

  StudentReply.fromJson(Map<String, dynamic> json) {
    assignmentThreadReplyID = json['assignmentThreadReplyID'];
    threadID = json['threadID'];
    userID = json['userID'];
    userName = json['userName'];
    isStudent = json['isStudent'];
    replyText = json['replyText'];
    replyDate = json['replyDate'];
    isRead = json['isRead'];
    if (json['attachments'] != null) {
      attachments = <Attachment>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

  // Helper method to format reply date
  String get formattedReplyDate {
    if (replyDate == null) return '';
    try {
      DateTime dateTime = DateTime.parse(replyDate!);
      return DateFormat('MMM d, yyyy').format(dateTime);
    } catch (e) {
      return replyDate ?? '';
    }
  }

  // Helper method to format reply date with time
  String get formattedReplyDateTime {
    if (replyDate == null) return '';
    try {
      DateTime dateTime = DateTime.parse(replyDate!);
      return DateFormat('MMM d, yyyy - h:mm a').format(dateTime);
    } catch (e) {
      return replyDate ?? '';
    }
  }

  // Helper method to get relative time (e.g., "2 hours ago")
  String get relativeTime {
    if (replyDate == null) return '';
    try {
      DateTime dateTime = DateTime.parse(replyDate!);
      DateTime now = DateTime.now();
      Duration difference = now.difference(dateTime);

      if (difference.inSeconds < 60) {
        return 'Just now';
      } else if (difference.inMinutes < 60) {
        int minutes = difference.inMinutes;
        return '$minutes minute${minutes == 1 ? '' : 's'} ago';
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
      return replyDate ?? '';
    }
  }

  // Helper method to get user initials
  String get userInitials {
    if (userName == null || userName!.isEmpty) return '?';
    List<String> names = userName!.trim().split(' ');
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }

  // Helper method to get reply preview (first 100 characters)
  String get replyPreview {
    if (replyText == null) return '';
    if (replyText!.length <= 100) return replyText!;
    return '${replyText!.substring(0, 100)}...';
  }

  // Helper method to check if reply has attachments
  bool get hasAttachments {
    return attachments != null && attachments!.isNotEmpty;
  }

  // Helper method to get attachment count
  int get attachmentCount {
    return attachments?.length ?? 0;
  }

  // Helper method to get user role text
  String get userRole {
    return isStudent == true ? 'Student' : 'Teacher';
  }

  // Helper method to get read status text
  String get readStatus {
    return isRead == true ? 'Read' : 'Unread';
  }

  // Helper method to check if reply is recent (within 24 hours)
  bool get isRecent {
    if (replyDate == null) return false;
    try {
      DateTime dateTime = DateTime.parse(replyDate!);
      DateTime now = DateTime.now();
      Duration difference = now.difference(dateTime);
      return difference.inHours < 24;
    } catch (e) {
      return false;
    }
  }

  // Copy method to create a copy with optional new values
  StudentReply copyWith({
    int? assignmentThreadReplyID,
    int? threadID,
    int? userID,
    String? userName,
    bool? isStudent,
    String? replyText,
    String? replyDate,
    bool? isRead,
    List<Attachment>? attachments,
  }) {
    return StudentReply(
      assignmentThreadReplyID: assignmentThreadReplyID ?? this.assignmentThreadReplyID,
      threadID: threadID ?? this.threadID,
      userID: userID ?? this.userID,
      userName: userName ?? this.userName,
      isStudent: isStudent ?? this.isStudent,
      replyText: replyText ?? this.replyText,
      replyDate: replyDate ?? this.replyDate,
      isRead: isRead ?? this.isRead,
      attachments: attachments ?? this.attachments,
    );
  }
}

class Attachment {
  int? attachmentID;
  String? fileName;
  String? fileUrl;
  String? fileType;
  int? fileSize;

  Attachment({
    this.attachmentID,
    this.fileName,
    this.fileUrl,
    this.fileType,
    this.fileSize,
  });

  Attachment.fromJson(Map<String, dynamic> json) {
    attachmentID = json['attachmentID'];
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
    fileType = json['fileType'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attachmentID'] = attachmentID;
    data['fileName'] = fileName;
    data['fileUrl'] = fileUrl;
    data['fileType'] = fileType;
    data['fileSize'] = fileSize;
    return data;
  }

  // Helper method to get file extension
  String get fileExtension {
    if (fileName == null || !fileName!.contains('.')) return '';
    return fileName!.split('.').last.toUpperCase();
  }

  // Helper method to get formatted file size
  String get formattedFileSize {
    if (fileSize == null) return '';
    
    double size = fileSize!.toDouble();
    if (size < 1024) {
      return '${size.toStringAsFixed(0)} B';
    } else if (size < 1024 * 1024) {
      return '${(size / 1024).toStringAsFixed(1)} KB';
    } else if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }

  // Helper method to check if file is an image
  bool get isImage {
    if (fileType == null) return false;
    return fileType!.toLowerCase().contains('image') ||
           ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(fileExtension.toLowerCase());
  }

  // Helper method to check if file is a document
  bool get isDocument {
    if (fileType == null) return false;
    return ['pdf', 'doc', 'docx', 'txt', 'xls', 'xlsx', 'ppt', 'pptx']
        .contains(fileExtension.toLowerCase());
  }

  // Helper method to check if file is a video
  bool get isVideo {
    if (fileType == null) return false;
    return fileType!.toLowerCase().contains('video') ||
           ['mp4', 'avi', 'mov', 'wmv', 'flv', 'mkv'].contains(fileExtension.toLowerCase());
  }

  // Helper method to check if file is audio
  bool get isAudio {
    if (fileType == null) return false;
    return fileType!.toLowerCase().contains('audio') ||
           ['mp3', 'wav', 'ogg', 'aac', 'm4a'].contains(fileExtension.toLowerCase());
  }

  // Helper method to get file icon name based on type
  String get fileIconType {
    if (isImage) return 'image';
    if (isDocument) return 'document';
    if (isVideo) return 'video';
    if (isAudio) return 'audio';
    return 'file';
  }

  // Helper method to get short file name (truncated if too long)
  String get shortFileName {
    if (fileName == null) return '';
    if (fileName!.length <= 30) return fileName!;
    
    String name = fileName!.substring(0, fileName!.lastIndexOf('.'));
    String ext = fileExtension;
    
    if (name.length > 20) {
      return '${name.substring(0, 20)}...$ext';
    }
    return fileName!;
  }

  // Copy method to create a copy with optional new values
  Attachment copyWith({
    int? attachmentID,
    String? fileName,
    String? fileUrl,
    String? fileType,
    int? fileSize,
  }) {
    return Attachment(
      attachmentID: attachmentID ?? this.attachmentID,
      fileName: fileName ?? this.fileName,
      fileUrl: fileUrl ?? this.fileUrl,
      fileType: fileType ?? this.fileType,
      fileSize: fileSize ?? this.fileSize,
    );
  }
}