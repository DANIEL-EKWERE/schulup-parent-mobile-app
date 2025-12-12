import 'dart:convert';

ReportModel reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) =>
    json.encode(data.toJson());

class ReportModel {
  bool? success;
  String? message;
  List<ReportData>? data;

  ReportModel({
    this.success,
    this.message,
    this.data,
  });

  ReportModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ReportData>[];
      json['data'].forEach((v) {
        data!.add(ReportData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReportData {
  int? studentID;
  int? batchID;
  int? reportCardTypeID;
  String? className;
  String? reportCardTypeName;

  ReportData({
    this.studentID,
    this.batchID,
    this.reportCardTypeID,
    this.className,
    this.reportCardTypeName,
  });

  ReportData.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'];
    batchID = json['batchID'];
    reportCardTypeID = json['reportCardTypeID'];
    className = json['className'];
    reportCardTypeName = json['reportCardTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studentID'] = studentID;
    data['batchID'] = batchID;
    data['reportCardTypeID'] = reportCardTypeID;
    data['className'] = className;
    data['reportCardTypeName'] = reportCardTypeName;
    return data;
  }

  // Helper method to format report card display text
  String get displayName {
    if (reportCardTypeName == null || className == null) {
      return reportCardTypeName ?? className ?? 'Unknown Report';
    }
    return '$reportCardTypeName - $className';
  }

  // Helper method to check if this is a valid report card
  bool get isValid {
    return studentID != null && 
           batchID != null && 
           reportCardTypeID != null;
  }
}