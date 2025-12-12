import 'dart:convert';

Subjects subjectsFromJson(String str) =>
    Subjects.fromJson(json.decode(str));

String subjectsToJson(Subjects data) =>
    json.encode(data.toJson());

class Subjects {
  bool? success;
  String? message;
  List<SubjectData>? data;

  Subjects({
    this.success,
    this.message,
    this.data,
  });

  Subjects.fromJson(Map<String, dynamic> json) {
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
  int? subjectMasterID;
  String? name;

  SubjectData({
    this.subjectMasterID,
    this.name,
  });

  SubjectData.fromJson(Map<String, dynamic> json) {
    subjectMasterID = json['subjectMasterID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subjectMasterID'] = subjectMasterID;
    data['name'] = name;
    return data;
  }
}