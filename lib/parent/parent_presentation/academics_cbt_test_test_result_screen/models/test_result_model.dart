import 'dart:convert';

QuizResult quizResultFromJson(String str) =>
    QuizResult.fromJson(json.decode(str));

String quizResultToJson(QuizResult data) => json.encode(data.toJson());

class QuizResult {
  dynamic studentAttemptID;
  dynamic quizID;
  String? quizTitle;
  String? subjectName;
  String? studentName;
  String? admissionNo;
  dynamic marksObtained;
  dynamic maximumMarksObtainable;
  dynamic percentageScore;
  String? started;
  String? submitted;
  String? duration;
  bool? showDetailedResults;
  List<Questions>? questions;

  QuizResult({
    this.studentAttemptID,
    this.quizID,
    this.quizTitle,
    this.subjectName,
    this.studentName,
    this.admissionNo,
    this.marksObtained,
    this.maximumMarksObtainable,
    this.percentageScore,
    this.started,
    this.submitted,
    this.duration,
    this.showDetailedResults,
    this.questions,
  });

  QuizResult.fromJson(Map<String, dynamic> json) {
    studentAttemptID = json['studentAttemptID'];
    quizID = json['quizID'];
    quizTitle = json['quizTitle'];
    subjectName = json['subjectName'];
    studentName = json['studentName'];
    admissionNo = json['admissionNo'];
    marksObtained = json['marksObtained'];
    maximumMarksObtainable = json['maximumMarksObtainable'];
    percentageScore = json['percentageScore'];
    started = json['started'];
    submitted = json['submitted'];
    duration = json['duration'];
    showDetailedResults = json['showDetailedResults'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentAttemptID'] = studentAttemptID;
    data['quizID'] = quizID;
    data['quizTitle'] = quizTitle;
    data['subjectName'] = subjectName;
    data['studentName'] = studentName;
    data['admissionNo'] = admissionNo;
    data['marksObtained'] = marksObtained;
    data['maximumMarksObtainable'] = maximumMarksObtainable;
    data['percentageScore'] = percentageScore;
    data['started'] = started;
    data['submitted'] = submitted;
    data['duration'] = duration;
    data['showDetailedResults'] = showDetailedResults;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  dynamic questionID;
  String? questionText;
  dynamic mark;
  dynamic markObtained;
  dynamic questionTypeID;
  dynamic questionOrder;
  List<Answers>? answers;
  List<StudentAnswers>? studentAnswers;

  Questions({
    this.questionID,
    this.questionText,
    this.mark,
    this.markObtained,
    this.questionTypeID,
    this.questionOrder,
    this.answers,
    this.studentAnswers,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    questionID = json['questionID'];
    questionText = json['questionText'];
    mark = json['mark'];
    markObtained = json['markObtained'];
    questionTypeID = json['questionTypeID'];
    questionOrder = json['questionOrder'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
    if (json['studentAnswers'] != null) {
      studentAnswers = <StudentAnswers>[];
      json['studentAnswers'].forEach((v) {
        studentAnswers!.add(StudentAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionID'] = questionID;
    data['questionText'] = questionText;
    data['mark'] = mark;
    data['markObtained'] = markObtained;
    data['questionTypeID'] = questionTypeID;
    data['questionOrder'] = questionOrder;
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    if (studentAnswers != null) {
      data['studentAnswers'] = studentAnswers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  dynamic answerID;
  String? answerText;
  bool? isCorrect;

  Answers({this.answerID, this.answerText, this.isCorrect});

  Answers.fromJson(Map<String, dynamic> json) {
    answerID = json['answerID'];
    answerText = json['answerText'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerID'] = answerID;
    data['answerText'] = answerText;
    data['isCorrect'] = isCorrect;
    return data;
  }
}

class StudentAnswers {
  dynamic studentAnswerID;
  dynamic answerID;
  String? answerText;
  bool? isCorrect;
  dynamic markObtained;

  StudentAnswers({
    this.studentAnswerID,
    this.answerID,
    this.answerText,
    this.isCorrect,
    this.markObtained,
  });

  StudentAnswers.fromJson(Map<String, dynamic> json) {
    studentAnswerID = json['studentAnswerID'];
    answerID = json['answerID'];
    answerText = json['answerText'];
    isCorrect = json['isCorrect'];
    markObtained = json['markObtained'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentAnswerID'] = studentAnswerID;
    data['answerID'] = answerID;
    data['answerText'] = answerText;
    data['isCorrect'] = isCorrect;
    data['markObtained'] = markObtained;
    return data;
  }
}
