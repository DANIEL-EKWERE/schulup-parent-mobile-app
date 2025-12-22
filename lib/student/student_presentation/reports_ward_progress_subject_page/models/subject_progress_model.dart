import 'dart:convert';

SubjectProgressModel subjectProgressFromJson(String str) =>
    SubjectProgressModel.fromJson(json.decode(str));

String subjectProgressToJson(SubjectProgressModel data) =>
    json.encode(data.toJson());

class SubjectProgressModel {
  bool? success;
  String? message;
  List<SubjectProgressData>? data;

  SubjectProgressModel({this.success, this.message, this.data});

  SubjectProgressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubjectProgressData>[];
      json['data'].forEach((v) {
        data!.add(SubjectProgressData.fromJson(v));
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

class SubjectProgressData {
  String? className;
  double? classAverage;
  double? studentScore;

  SubjectProgressData({this.className, this.classAverage, this.studentScore});

  SubjectProgressData.fromJson(Map<String, dynamic> json) {
    className = json['className'];
    classAverage = json['classAverage'];
    studentScore = json['studentScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['className'] = className;
    data['classAverage'] = classAverage;
    data['studentScore'] = studentScore;
    return data;
  }

  // Helper method to calculate performance relative to class average
  double get performanceRatio {
    if (classAverage == null || classAverage == 0 || studentScore == null) {
      return 0.0;
    }
    return studentScore! / classAverage!;
  }

  // Helper method to check if student is above average
  bool get isAboveAverage {
    if (classAverage == null || studentScore == null) return false;
    return studentScore! > classAverage!;
  }
}
