import 'dart:convert';

StudentClass studentClassFromJson(String str) =>
    StudentClass.fromJson(json.decode(str));

String studentClassToJson(StudentClass data) => json.encode(data.toJson());

class StudentClass {
  bool? success;
  String? message;
  List<ClassData>? data;

  StudentClass({this.success, this.message, this.data});

  StudentClass.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ClassData>[];
      json['data'].forEach((v) {
        data!.add(ClassData.fromJson(v));
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

class ClassData {
  int? classID;
  String? name;
  dynamic isActive;

  ClassData({this.classID, this.name, this.isActive});

  ClassData.fromJson(Map<String, dynamic> json) {
    classID = json['classID'];
    name = json['name'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['classID'] = classID;
    data['name'] = name;
    data['isActive'] = isActive;
    return data;
  }
}
