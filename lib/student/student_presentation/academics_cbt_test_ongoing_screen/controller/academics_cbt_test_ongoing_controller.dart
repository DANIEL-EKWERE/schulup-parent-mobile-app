// // TODO Implement this library.
// import 'package:flutter/material.dart';
// import '../../../core/app_export.dart';
// import '../models/academics_cbt_test_ongoing_model.dart';

// /// A controller class for the AcademicsCbtTestOngoingScreen.
// ///
// /// This class manages the state of the AcademicsCbtTestOngoingScreen, including the
// /// current academicsCbtTestOngoingModelObj
// class AcademicsCbtTestOngoingController extends GetxController {
//   Rx<AcademicsCbtTestOngoingModel> academicsCbtTestOngoingModelObj =
//       AcademicsCbtTestOngoingModel().obs;

//   Rx<String> whowasthe = "".obs;
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schulupparent/student/core/utils/size_utils.dart';
import 'package:schulupparent/student/data/apiClient/api_client.dart';
import 'package:schulupparent/student/student_presentation/academics_cbt_test_test_details_screen/models/academics_cbt_test_test_details_model.dart';
import 'package:schulupparent/student/routes/app_routes.dart';
import 'package:schulupparent/student/student_presentation/academics_cbt_test_test_result_screen/academics_cbt_test_test_result_screen.dart';
import 'package:schulupparent/student/theme/custom_button_style.dart';
import 'package:schulupparent/student/theme/custom_text_style.dart';
import 'package:schulupparent/student/widgets/custom_elevated_button.dart';
// import '../models/academics_cbt_test_test_details_model.dart';

class StudentAcademicsCbtTestOngoingController extends GetxController {
  // Test data
  Rx<StudentAcademicsCbtTestTestDetailsModel> startTest =
      StudentAcademicsCbtTestTestDetailsModel().obs;
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));
  // Current question tracking
  var currentQuestionIndex = 0.obs;

  // Timer
  var remainingSeconds = 0.obs;
  Timer? _timer;

  // Answers storage: Map<questionID, AnswerData>
  var selectedAnswers = <int, AnswerData>{}.obs;

  // UI state
  var isLoading = false.obs;
  var isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Get the StartTest data passed from previous screen
    if (Get.arguments != null && Get.arguments['startTest'] != null) {
      startTest.value = Get.arguments['startTest'];
      _initializeTimer();
    }
  }

  void _initializeTimer() {
    if (startTest.value.isTimed == true) {
      remainingSeconds.value = startTest.value.timeLimitSeconds ?? 0;
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
        // Auto-submit when time runs out
        _showTimeUpDialog();
      }
    });
  }

  void _showTimeUpDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text('Time\'s Up!'),
          content: Text(
            'Your time has expired. The test will now be submitted.',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
                submitTest();
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  // Get current question
  Questions? get currentQuestion {
    if (startTest.value.questions == null || startTest.value.questions!.isEmpty)
      return null;
    return startTest.value.questions![currentQuestionIndex.value];
  }

  // Get answer for current question
  AnswerData? get currentQuestionAnswer {
    final question = currentQuestion;
    if (question?.questionID == null) return null;
    return selectedAnswers[question!.questionID!];
  }

  // Select answer (for single choice - questionTypeID = 1)
  void selectSingleAnswer(int questionId, int questionTypeId, int answerId) {
    selectedAnswers[questionId] = AnswerData(
      questionID: questionId,
      questionTypeID: questionTypeId,
      selectedAnswerIDs: [answerId],
      textAnswer: null,
    );
  }

  // Toggle answer (for multiple choice - questionTypeID = 2)
  void toggleMultipleAnswer(int questionId, int questionTypeId, int answerId) {
    if (selectedAnswers[questionId] == null) {
      selectedAnswers[questionId] = AnswerData(
        questionID: questionId,
        questionTypeID: questionTypeId,
        selectedAnswerIDs: [answerId],
        textAnswer: null,
      );
    } else {
      final currentAnswers = selectedAnswers[questionId]!.selectedAnswerIDs;
      if (currentAnswers.contains(answerId)) {
        currentAnswers.remove(answerId);
      } else {
        currentAnswers.add(answerId);
      }
      selectedAnswers[questionId] = AnswerData(
        questionID: questionId,
        questionTypeID: questionTypeId,
        selectedAnswerIDs: currentAnswers,
        textAnswer: null,
      );
    }
    selectedAnswers.refresh();
  }

  // Set text answer (for essay/text - questionTypeID = 3)
  void setTextAnswer(int questionId, int questionTypeId, String text) {
    selectedAnswers[questionId] = AnswerData(
      questionID: questionId,
      questionTypeID: questionTypeId,
      selectedAnswerIDs: [],
      textAnswer: text.isNotEmpty ? text : null,
    );
  }

  // Check if answer is selected for current question
  bool isAnswerSelected(int answerId) {
    final answer = currentQuestionAnswer;
    if (answer == null) return false;
    return answer.selectedAnswerIDs.contains(answerId);
  }

  // Navigation
  void nextQuestion() {
    if (currentQuestionIndex.value <
        (startTest.value.questions?.length ?? 0) - 1) {
      currentQuestionIndex.value++;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < (startTest.value.questions?.length ?? 0)) {
      currentQuestionIndex.value = index;
    }
  }

  // Computed properties
  bool get isFirstQuestion => currentQuestionIndex.value == 0;

  bool get isLastQuestion =>
      currentQuestionIndex.value ==
      (startTest.value.questions?.length ?? 0) - 1;

  int get totalQuestions => startTest.value.questions?.length ?? 0;

  int get answeredQuestionsCount => selectedAnswers.length;

  double get progressPercentage {
    if (totalQuestions == 0) return 0;
    return (currentQuestionIndex.value + 1) / totalQuestions;
  }

  String get formattedTimeRemaining {
    final minutes = remainingSeconds.value ~/ 60;
    final seconds = remainingSeconds.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // Check if question is answered
  bool isQuestionAnswered(int questionIndex) {
    if (startTest.value.questions == null ||
        questionIndex >= startTest.value.questions!.length)
      return false;

    final questionId = startTest.value.questions![questionIndex].questionID;
    if (questionId == null) return false;

    return selectedAnswers.containsKey(questionId);
  }

  // Show question navigator
  void showQuestionNavigator() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Question Navigator',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: totalQuestions,
                itemBuilder: (context, index) {
                  final isAnswered = isQuestionAnswered(index);
                  final isCurrent = index == currentQuestionIndex.value;

                  return GestureDetector(
                    onTap: () {
                      goToQuestion(index);
                      // Get.back();
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            isCurrent
                                ? Color(0xFFFF8D2A)
                                : isAnswered
                                ? Colors.green.shade100
                                : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              isCurrent
                                  ? Color(0xFFFF8D2A)
                                  : isAnswered
                                  ? Colors.green
                                  : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: isCurrent ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildLegendItem(Colors.green.shade100, 'Answered'),
                _buildLegendItem(Colors.grey.shade200, 'Not Answered'),
                _buildLegendItem(Color(0xFFFF8D2A), 'Current'),
              ],
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  // Submit test
  Future<void> submitTest() async {
    // Validate that all questions are answered (optional)
    if (answeredQuestionsCount < totalQuestions) {
      final shouldSubmit = await _showIncompleteTestDialog();
      if (shouldSubmit != true) return;
    }

    try {
      isSubmitting.value = true;
      _timer?.cancel();

      // Prepare submission data
      final submission = {
        'studentAttemptID': startTest.value.studentAttemptID,
        'answers': selectedAnswers.values.map((e) => e.toJson()).toList(),
      };

      // TODO: Replace with your actual API call
      final response = await _apiService.submitTest(submission);

      // Simulate API call
      // await Future.delayed(Duration(seconds: 2));
      if (response.statusCode == 200 || response.statusCode == 201) {
        isSubmitting.value = false;
        Get.snackbar(
          'Success',
          'Test submitted successfully!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Get.toNamed(AppRoutes.academicsCbtTestTestResultScreen);

        Get.to(() => StudentAcademicsCbtTestTestResultScreen());
      }

      // Navigate to results or home

      //Get.back();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to submit test: $e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isSubmitting.value = false;
    }
  }

  Future<bool?> _showIncompleteTestDialog() async {
    return await Get.dialog<bool>(
      // AlertDialog(
      //   title: Text('Incomplete Test'),
      //   content: Text(
      //     'You have answered $answeredQuestionsCount out of $totalQuestions questions.\n\nDo you want to submit anyway?',
      //   ),
      //   actions: [
      //     TextButton(
      //       onPressed: () => Get.back(result: false),
      //       child: Text('Cancel'),
      //     ),
      //     ElevatedButton(
      //       onPressed: () => Get.back(result: true),
      //       style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFF8D2A)),
      //       child: Text('Submit'),
      //     ),
      //   ],
      // ),
      AlertDialog(
        iconPadding: EdgeInsets.only(top: 40, bottom: 10),
        icon: Icon(
          Icons.info_outline_rounded,
          size: 60,
          weight: 2,
          fontWeight: FontWeight.w200,
        ),
        iconColor: Colors.red,
        title: Text(
          'Incomplete Test!',
          style: CustomTextStyles.bodyMediumOnPrimary.copyWith(fontSize: 18),
        ),
        //contentTextStyle: TextStyle(al),
        content: Text(
          textAlign: TextAlign.center,
          'You have answered $answeredQuestionsCount out of $totalQuestions questions.\n\nDo you want to submit anyway?',
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomElevatedButton(
                buttonTextStyle: CustomTextStyles.bodySmallWhiteA700_1,
                buttonStyle: CustomButtonStyles.fillPrimary,
                text: 'Submit',
                onPressed: () {
                  // submitTest();
                  Navigator.pop(Get.context!, true);
                },
              ),
              TextButton(
                onPressed: () => Navigator.pop(Get.context!, false),
                child: Text('Cancel'),
              ),

              // ElevatedButton(
              //   onPressed: () => Get.back(result: true),
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              //   child: Text('Exit'),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

// Answer data model for submission
class AnswerData {
  final int questionID;
  final int questionTypeID;
  final List<int> selectedAnswerIDs;
  final String? textAnswer;

  AnswerData({
    required this.questionID,
    required this.questionTypeID,
    required this.selectedAnswerIDs,
    this.textAnswer,
  });

  Map<String, dynamic> toJson() {
    return {
      'questionID': questionID,
      'questionTypeID': questionTypeID,
      'selectedAnswerIDs': selectedAnswerIDs,
      'textAnswer': textAnswer,
    };
  }
}
