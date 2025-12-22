import 'dart:convert';

/// This class defines the variables used in the [reports_ward_progress_class_page],
/// and is typically used to hold data that is passed between different parts of the application.

ReportsWardProgressClassModel reportsWardProgressClassModelFromJson(
  String str,
) => ReportsWardProgressClassModel.fromJson(json.decode(str));

String reportsWardProgressClassModelToJson(
  ReportsWardProgressClassModel data,
) => json.encode(data.toJson());

class ReportsWardProgressClassModel {
  bool? success;
  String? message;
  List<AcademicsPerformance>? data;

  ReportsWardProgressClassModel({this.success, this.message, this.data});

  ReportsWardProgressClassModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AcademicsPerformance>[];
      json['data'].forEach((v) {
        data!.add(AcademicsPerformance.fromJson(v));
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

class AcademicsPerformance {
  String? className;
  dynamic studentAverage;

  AcademicsPerformance({this.className, this.studentAverage});

  AcademicsPerformance.fromJson(Map<String, dynamic> json) {
    className = json['className'];
    studentAverage = json['studentAverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['className'] = className;
    data['studentAverage'] = studentAverage;
    return data;
  }
}
