import 'dart:convert';

ClassOverview subjectPerformanceFromJson(String str) =>
    ClassOverview.fromJson(json.decode(str));

String subjectPerformanceToJson(ClassOverview data) =>
    json.encode(data.toJson());

class ClassOverview {
  bool? success;
  String? message;
  List<SubjectData>? data;

  ClassOverview({this.success, this.message, this.data});

  ClassOverview.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubjectData>[];
      json['data'].forEach((v) {
        data!.add(SubjectData.fromJson(v));
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

class SubjectData {
  String? subjectName;
  double? classAverage;
  double? studentScore;

  SubjectData({this.subjectName, this.classAverage, this.studentScore});

  SubjectData.fromJson(Map<String, dynamic> json) {
    subjectName = json['subjectName'];
    classAverage = json['classAverage']?.toDouble();
    studentScore = json['studentScore']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectName'] = subjectName;
    data['classAverage'] = classAverage;
    data['studentScore'] = studentScore;
    return data;
  }
}
