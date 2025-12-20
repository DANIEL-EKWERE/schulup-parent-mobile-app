import 'dart:convert';

StudentAcademicsCbtTestTestDetailsModel startTestFromJson(String str) =>
    StudentAcademicsCbtTestTestDetailsModel.fromJson(json.decode(str));

String startTestToJson(StudentAcademicsCbtTestTestDetailsModel data) =>
    json.encode(data.toJson());

class StudentAcademicsCbtTestTestDetailsModel {
  final int? studentAttemptID;
  final int? quizID;
  final int? quizScheduleID;
  final String? quizTitle;
  final String? subjectName;
  final int? noOfQuestions;
  final int? timeLimit;
  final int? timeLimitSeconds;
  final bool? isTimed;
  final bool? showResult;
  final List<Questions>? questions;

  StudentAcademicsCbtTestTestDetailsModel({
    this.studentAttemptID,
    this.quizID,
    this.quizScheduleID,
    this.quizTitle,
    this.subjectName,
    this.noOfQuestions,
    this.timeLimit,
    this.timeLimitSeconds,
    this.isTimed,
    this.showResult,
    this.questions,
  });

  StudentAcademicsCbtTestTestDetailsModel.fromJson(Map<String, dynamic> json)
    : studentAttemptID = json['studentAttemptID'],
      quizID = json['quizID'],
      quizScheduleID = json['quizScheduleID'],
      quizTitle = json['quizTitle'],
      subjectName = json['subjectName'],
      noOfQuestions = json['noOfQuestions'],
      timeLimit = json['timeLimit'],
      timeLimitSeconds = json['timeLimitSeconds'],
      isTimed = json['isTimed'],
      showResult = json['showResult'],
      questions =
          json['questions'] != null
              ? (json['questions'] as List)
                  .map((v) => Questions.fromJson(v))
                  .toList()
              : null;

  Map<String, dynamic> toJson() {
    return {
      'studentAttemptID': studentAttemptID,
      'quizID': quizID,
      'quizScheduleID': quizScheduleID,
      'quizTitle': quizTitle,
      'subjectName': subjectName,
      'noOfQuestions': noOfQuestions,
      'timeLimit': timeLimit,
      'timeLimitSeconds': timeLimitSeconds,
      'isTimed': isTimed,
      'showResult': showResult,
      if (questions != null)
        'questions': questions!.map((v) => v.toJson()).toList(),
    };
  }
}

class Questions {
  final int? questionID;
  final String? questionText;
  final double? mark;
  final int? questionTypeID;
  final String? questionTypeName;
  final int? questionOrder;
  final List<Answers>? answers;

  Questions({
    this.questionID,
    this.questionText,
    this.mark,
    this.questionTypeID,
    this.questionTypeName,
    this.questionOrder,
    this.answers,
  });

  Questions.fromJson(Map<String, dynamic> json)
    : questionID = json['questionID'],
      questionText = json['questionText'],
      mark = json['mark'],
      questionTypeID = json['questionTypeID'],
      questionTypeName = json['questionTypeName'],
      questionOrder = json['questionOrder'],
      answers =
          json['answers'] != null
              ? (json['answers'] as List)
                  .map((v) => Answers.fromJson(v))
                  .toList()
              : null;

  Map<String, dynamic> toJson() {
    return {
      'questionID': questionID,
      'questionText': questionText,
      'mark': mark,
      'questionTypeID': questionTypeID,
      'questionTypeName': questionTypeName,
      'questionOrder': questionOrder,
      if (answers != null) 'answers': answers!.map((v) => v.toJson()).toList(),
    };
  }
}

class Answers {
  final int? answerID;
  final String? answerText;
  final String? answerLabel;

  Answers({this.answerID, this.answerText, this.answerLabel});

  Answers.fromJson(Map<String, dynamic> json)
    : answerID = json['answerID'],
      answerText = json['answerText'],
      answerLabel = json['answerLabel'];

  Map<String, dynamic> toJson() {
    return {
      'answerID': answerID,
      'answerText': answerText,
      'answerLabel': answerLabel,
    };
  }
}
