import 'dart:convert';

AssignmentDetails assignmentDetailsFromJson(String str) =>
    AssignmentDetails.fromJson(json.decode(str));

String assignmentDetailsToJson(AssignmentDetails data) =>
    json.encode(data.toJson());

class AssignmentDetails {
  final bool? success;
  final String? message;
  final Data? data;

  AssignmentDetails({this.success, this.message, this.data});

  AssignmentDetails.fromJson(Map<String, dynamic> json)
    : success = json['success'],
      message = json['message'],
      data = json['data'] != null ? Data.fromJson(json['data']) : null;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      if (data != null) 'data': data!.toJson(),
    };
  }
}

class Data {
  final int? assignmentID;
  final String? title;
  final String? content;
  final String? teachersName;
  final int? teacherEmployeeID;
  final String? className;
  final int? batchID;
  final String? subjectName;
  final int? subjectID;
  final String? datePosted;
  final String? dueDate;
  final bool? markAssignment;
  final double? maximumMark;
  final double? minimumMark;
  final bool? preventLateSubmission;
  final bool? isDraft;
  final List<Attachment>? attachments;

  Data({
    this.assignmentID,
    this.title,
    this.content,
    this.teachersName,
    this.teacherEmployeeID,
    this.className,
    this.batchID,
    this.subjectName,
    this.subjectID,
    this.datePosted,
    this.dueDate,
    this.markAssignment,
    this.maximumMark,
    this.minimumMark,
    this.preventLateSubmission,
    this.isDraft,
    this.attachments,
  });

  Data.fromJson(Map<String, dynamic> json)
    : assignmentID = json['assignmentID'],
      title = json['title'],
      content = json['content'],
      teachersName = json['teachersName'],
      teacherEmployeeID = json['teacherEmployeeID'],
      className = json['className'],
      batchID = json['batchID'],
      subjectName = json['subjectName'],
      subjectID = json['subjectID'],
      datePosted = json['datePosted'],
      dueDate = json['dueDate'],
      markAssignment = json['markAssignment'],
      maximumMark = json['maximumMark'],
      minimumMark = json['minimumMark'],
      preventLateSubmission = json['preventLateSubmission'],
      isDraft = json['isDraft'],
      attachments =
          json['attachments'] != null
              ? (json['attachments'] as List)
                  .map((v) => Attachment.fromJson(v))
                  .toList()
              : null;

  Map<String, dynamic> toJson() {
    return {
      'assignmentID': assignmentID,
      'title': title,
      'content': content,
      'teachersName': teachersName,
      'teacherEmployeeID': teacherEmployeeID,
      'className': className,
      'batchID': batchID,
      'subjectName': subjectName,
      'subjectID': subjectID,
      'datePosted': datePosted,
      'dueDate': dueDate,
      'markAssignment': markAssignment,
      'maximumMark': maximumMark,
      'minimumMark': minimumMark,
      'preventLateSubmission': preventLateSubmission,
      'isDraft': isDraft,
      if (attachments != null)
        'attachments': attachments!.map((v) => v.toJson()).toList(),
    };
  }
}

class Attachment {
  final int? id;
  final String? fileName;
  final String? fileUrl;
  final String? fileType;
  final int? fileSize;

  Attachment({
    this.id,
    this.fileName,
    this.fileUrl,
    this.fileType,
    this.fileSize,
  });

  Attachment.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      fileName = json['fileName'] ?? json['filename'],
      fileUrl = json['fileUrl'] ?? json['url'],
      fileType = json['fileType'] ?? json['type'],
      fileSize = json['fileSize'] ?? json['size'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileName': fileName,
      'fileUrl': fileUrl,
      'fileType': fileType,
      'fileSize': fileSize,
    };
  }
}
