import 'dart:convert';

DashBoardStats dashBoardStatsFromJson(String str) =>
    DashBoardStats.fromJson(json.decode(str));

String dashBoardStatsToJson(DashBoardStats data) => json.encode(data.toJson());

class DashBoardStats {
  bool? success;
  String? message;
  String? studentName;
  List<DashboardData>? data;

  DashBoardStats({this.success, this.message, this.studentName, this.data});

  DashBoardStats.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    studentName = json['studentName'];
    if (json['data'] != null) {
      data = <DashboardData>[];
      json['data'].forEach((v) {
        data!.add(new DashboardData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    data['studentName'] = this.studentName;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashboardData {
  String? className;
  double? studentAverage;

  DashboardData({this.className, this.studentAverage});

  DashboardData.fromJson(Map<String, dynamic> json) {
    className = json['className'];
    studentAverage = json['studentAverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['className'] = className;
    data['studentAverage'] = studentAverage;
    return data;
  }
}
