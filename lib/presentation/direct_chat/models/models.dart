import 'dart:convert';

ClassTeacher classTeacherFromJson(String str) =>
    ClassTeacher.fromJson(json.decode(str));

String classTeacherToJson(ClassTeacher data) =>
    json.encode(data.toJson());

class ClassTeacher {
  bool? success;
  String? message;
  List<TeacherData>? data;

  ClassTeacher({
    this.success,
    this.message,
    this.data,
  });

  ClassTeacher.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TeacherData>[];
      json['data'].forEach((v) {
        data!.add(TeacherData.fromJson(v));
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

class TeacherData {
  int? teacherUserId;
  String? teacherName;
  String? profilePicBase64;
  bool? hasProfilePic;

  TeacherData({
    this.teacherUserId,
    this.teacherName,
    this.profilePicBase64,
    this.hasProfilePic,
  });

  TeacherData.fromJson(Map<String, dynamic> json) {
    teacherUserId = json['teacherUserId'];
    teacherName = json['teacherName'];
    profilePicBase64 = json['profilePicBase64'];
    hasProfilePic = json['hasProfilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teacherUserId'] = teacherUserId;
    data['teacherName'] = teacherName;
    data['profilePicBase64'] = profilePicBase64;
    data['hasProfilePic'] = hasProfilePic;
    return data;
  }

  // Helper method to get teacher initials
  String get initials {
    if (teacherName == null || teacherName!.isEmpty) return '';
    List<String> names = teacherName!.trim().split(' ');
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }
}