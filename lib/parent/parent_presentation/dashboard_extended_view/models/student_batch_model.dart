import 'dart:convert';

StudentBatch studentBatchFromJson(String str) =>
    StudentBatch.fromJson(json.decode(str));

String studentBatchToJson(StudentBatch data) =>
    json.encode(data.toJson());

class StudentBatch {
  bool? success;
  String? message;
  List<BatchData>? data;

  StudentBatch({
    this.success,
    this.message,
    this.data,
  });

  StudentBatch.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BatchData>[];
      json['data'].forEach((v) {
        data!.add(BatchData.fromJson(v));
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

class BatchData {
  int? batchID;
  String? name;

  BatchData({
    this.batchID,
    this.name,
  });

  BatchData.fromJson(Map<String, dynamic> json) {
    batchID = json['batchID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['batchID'] = batchID;
    data['name'] = name;
    return data;
  }
}