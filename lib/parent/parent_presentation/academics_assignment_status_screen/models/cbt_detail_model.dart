import 'dart:convert';

CbtDetail cbtDetailFromJson(String str) => CbtDetail.fromJson(json.decode(str));

String cbtDetailToJson(CbtDetail data) => json.encode(data.toJson());

class CbtDetail {
  final int? quizID;
  final int? quizScheduleID;
  final String? quizTitle;
  final String? subjectName;
  final String? instructions;
  final int? noOfQuestions;
  final int? timeLimit;
  final String? allowedAttempts;
  final bool? isTimed;
  final bool? showResult;

  CbtDetail({
    this.quizID,
    this.quizScheduleID,
    this.quizTitle,
    this.subjectName,
    this.instructions,
    this.noOfQuestions,
    this.timeLimit,
    this.allowedAttempts,
    this.isTimed,
    this.showResult,
  });

  CbtDetail.fromJson(Map<String, dynamic> json)
      : quizID = json['quizID'],
        quizScheduleID = json['quizScheduleID'],
        quizTitle = json['quizTitle'],
        subjectName = json['subjectName'],
        instructions = json['instructions'],
        noOfQuestions = json['noOfQuestions'],
        timeLimit = json['timeLimit'],
        allowedAttempts = json['allowedAttempts'],
        isTimed = json['isTimed'],
        showResult = json['showResult'];

  Map<String, dynamic> toJson() {
    return {
      'quizID': quizID,
      'quizScheduleID': quizScheduleID,
      'quizTitle': quizTitle,
      'subjectName': subjectName,
      'instructions': instructions,
      'noOfQuestions': noOfQuestions,
      'timeLimit': timeLimit,
      'allowedAttempts': allowedAttempts,
      'isTimed': isTimed,
      'showResult': showResult,
    };
  }
}