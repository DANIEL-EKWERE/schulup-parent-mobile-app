import 'dart:convert';

Cbt cbtFromJson(String str) => Cbt.fromJson(json.decode(str));

String cbtToJson(Cbt data) => json.encode(data.toJson());

class Cbt {
  final bool? success;
  final String? message;
  final List<CbtData>? data;
  final Pagination? pagination;

  Cbt({
    this.success,
    this.message,
    this.data,
    this.pagination,
  });

  Cbt.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        message = json['message'],
        data = json['data'] != null
            ? (json['data'] as List).map((v) => CbtData.fromJson(v)).toList()
            : null,
        pagination = json['pagination'] != null
            ? Pagination.fromJson(json['pagination'])
            : null;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      if (data != null) 'data': data!.map((v) => v.toJson()).toList(),
      if (pagination != null) 'pagination': pagination!.toJson(),
    };
  }
}

class CbtData {
  final int? quizScheduleID;
  final int? quizID;
  final String? quizTitle;
  final String? batchName;
  final String? subjectName;
  final int? noOfQuestions;
  final int? timeLimit;
  final String? allowedAttempts;
  final int? attemptsMade;
  final String? startDate;
  final String? endDate;
  final bool? showResult;
  final bool? isTimed;

  CbtData({
    this.quizScheduleID,
    this.quizID,
    this.quizTitle,
    this.batchName,
    this.subjectName,
    this.noOfQuestions,
    this.timeLimit,
    this.allowedAttempts,
    this.attemptsMade,
    this.startDate,
    this.endDate,
    this.showResult,
    this.isTimed,
  });

  CbtData.fromJson(Map<String, dynamic> json)
      : quizScheduleID = json['quizScheduleID'],
        quizID = json['quizID'],
        quizTitle = json['quizTitle'],
        batchName = json['batchName'],
        subjectName = json['subjectName'],
        noOfQuestions = json['noOfQuestions'],
        timeLimit = json['timeLimit'],
        allowedAttempts = json['allowedAttempts'],
        attemptsMade = json['attemptsMade'],
        startDate = json['startDate'],
        endDate = json['endDate'],
        showResult = json['showResult'],
        isTimed = json['isTimed'];

  Map<String, dynamic> toJson() {
    return {
      'quizScheduleID': quizScheduleID,
      'quizID': quizID,
      'quizTitle': quizTitle,
      'batchName': batchName,
      'subjectName': subjectName,
      'noOfQuestions': noOfQuestions,
      'timeLimit': timeLimit,
      'allowedAttempts': allowedAttempts,
      'attemptsMade': attemptsMade,
      'startDate': startDate,
      'endDate': endDate,
      'showResult': showResult,
      'isTimed': isTimed,
    };
  }
}

class Pagination {
  final int? currentPage;
  final int? pageSize;
  final int? totalCount;
  final int? totalPages;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  Pagination({
    this.currentPage,
    this.pageSize,
    this.totalCount,
    this.totalPages,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : currentPage = json['currentPage'],
        pageSize = json['pageSize'],
        totalCount = json['totalCount'],
        totalPages = json['totalPages'],
        hasNextPage = json['hasNextPage'],
        hasPreviousPage = json['hasPreviousPage'];

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'pageSize': pageSize,
      'totalCount': totalCount,
      'totalPages': totalPages,
      'hasNextPage': hasNextPage,
      'hasPreviousPage': hasPreviousPage,
    };
  }
}