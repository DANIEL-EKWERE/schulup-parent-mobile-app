import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/dashboard_extended_view/controller/dashboard_extended_view_controller.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/comments_model.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/daily_report_model.dart';
import 'package:schulupparent/parent/parent_presentation/reports_report_card_all_variants_page/models/report_model.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/app_export.dart';
import '../models/reports_report_card_all_variants_model.dart';

/// A controller class for the ReportsReportCardAllVariantsPage.
///
/// This class manages the state of the ReportsReportCardAllVariantsPage, including the
/// current reportsReportCardAllVariantsModelObj
class ReportsReportCardAllVariantsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ReportsReportCardAllVariantsController(
    this.reportsReportCardAllVariantsModelObj,
  );

  Rx<ReportsReportCardAllVariantsModel> reportsReportCardAllVariantsModelObj;
  TextEditingController messageController = TextEditingController();
  Rx<String> termType = 'First'.obs;
  Rx<String> dayType = 'Daily'.obs;
  Rx<String> session = ''.obs;
  Rx<int> selectedTermId = 1.obs;
  Rx<int> tabIndex = 0.obs;
  RxList<Messages> tempMessageList = <Messages>[].obs;
  Rx<String> date = ''.obs;
  DateTime? datex;
  late TabController tabviewController = Get.put(
    TabController(vsync: this, length: 3),
  );
  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  void onrefresh() {
    getWeeklyReports();
    getDailyReports();
    getTermlyReports();
  }

  DashboardExtendedViewController dashboardExtendedViewController =
      Get.find<DashboardExtendedViewController>();
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  DailyReport? dailyReports;
  List<DailyReportDate> dailyReportDataList = [];

  ReportModel? reportsWeekly;
  List<ReportData> reportDataWeeklyList = [];

  ReportModel? reportsTermly;
  List<ReportData> reportDataTermlyList = [];

  Comments? commets;
  List<Messages> messageList = [];

  ReportData? selectedReport;

  DailyReportDate? selectedDailyReport;

  String? selectedReportId;
  Rx<bool> isCommentsSendLoading = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isCommentsLoading = false.obs;
  Rx<bool> isLoading1 = false.obs;

  // SubjectProgressModel? subjectProgress;
  // List<SubjectProgressData> subjectProgressDataList = [];
  @override
  void onInit() {
    super.onInit();
    getWeeklyReports();
    getTermlyReports();
    datex = DateTime.now();
    date.value = formatDate(datex.toString());

    // termType.value =
    //     dashboardExtendedViewController.selectedTerm1.value!.termID == 1
    //         ? "First"
    //         : dashboardExtendedViewController.selectedTerm1.value!.termID == 2
    //         ? "Second"
    //         : "Third";
    // selectedTermId.value =
    //     dashboardExtendedViewController.selectedTerm1.value!.termID == 1
    //         ? 1
    //         : dashboardExtendedViewController.selectedTerm1.value!.termID == 2
    //         ? 2
    //         : 3;
    // // getTermlyReports();
    // // Timer(Duration(seconds: 3), (){
    // //   getSubjectProgress();
    // // });
    // session.value =
    //     dashboardExtendedViewController.selectedAcademicSessionData!.name!;
    setValues();
  }

  void setValues () {
    termType.value =
        dashboardExtendedViewController.selectedTerm1.value!.termID == 1
            ? "First"
            : dashboardExtendedViewController.selectedTerm1.value!.termID == 2
                ? "Second"
                : "Third";
    selectedTermId.value =
        dashboardExtendedViewController.selectedTerm1.value!.termID == 1
            ? 1
            : dashboardExtendedViewController.selectedTerm1.value!.termID == 2
                ? 2
                : 3;
    session.value =
        dashboardExtendedViewController.selectedAcademicSessionData!.name!;
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('MMM. d, yyyy').format(dateTime);
  }

  Future<void> getTermlyReports() async {
    isLoading.value = true;
    try {
      if (termType.value.contains('First Term')) {
        selectedTermId.value = 1;
      } else if (termType.value.contains('Second Term')) {
        selectedTermId.value = 2;
      } else if (termType.value.contains('Third Term')) {
        selectedTermId.value = 3;
      }
      final response = await _apiService.getTermlyReport(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        dashboardExtendedViewController
            .selectedAcademicSessionData!
            .academicSessionID
            .toString(),
        selectedTermId.value.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        reportsTermly = reportModelFromJson(response.body);
        reportDataTermlyList = reportsTermly!.data!;
        selectedReport =
            reportDataTermlyList.isNotEmpty ? reportDataTermlyList.first : null;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
      } else {
        // OverlayLoadingProgress.stop();
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      isLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
      isLoading.value = false;
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  Future<void> getWeeklyReports() async {
    isLoading.value = true;
    try {
      if (termType.value.contains('First Term')) {
        selectedTermId.value = 1;
      } else if (termType.value.contains('Second Term')) {
        selectedTermId.value = 2;
      } else if (termType.value.contains('Third Term')) {
        selectedTermId.value = 3;
      }
      final response = await _apiService.getWeeklyReport(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        dashboardExtendedViewController
            .selectedAcademicSessionData!
            .academicSessionID
            .toString(),
        selectedTermId.value.toString(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;
        reportsWeekly = reportModelFromJson(response.body);
        reportDataWeeklyList = reportsWeekly!.data!;
        selectedReport =
            reportDataWeeklyList.isNotEmpty ? reportDataWeeklyList.first : null;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
      } else {
        // OverlayLoadingProgress.stop();
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      isLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
      isLoading.value = false;
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  Future<void> getDailyReports() async {
    isLoading.value = true;
    try {
      final response = await _apiService.getDailyReport(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        formatDate1(datex.toString()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isLoading.value = false;

        dailyReports = dailyReportFromJson(response.body);
        dailyReportDataList = dailyReports!.data;
        selectedDailyReport =
            dailyReportDataList.isNotEmpty ? dailyReportDataList.first : null;
        getCommets();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isLoading.value = false;
      } else {
        // OverlayLoadingProgress.stop();
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      isLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
      isLoading.value = false;
    } finally {
      // OverlayLoadingProgress.stop();
      isLoading.value = false;
    }
  }

  Future<void> getCommets() async {
    tempMessageList.clear();
    if (tempMessageList.isEmpty) {
      isCommentsLoading.value = true;
    }
    try {
      final response = await _apiService.getCommets(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        formatDate1(datex.toString()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        isCommentsLoading.value = false;

        commets = commentsFromJson(response.body);
        messageList = commets!.data!.messages!;
        tempMessageList.value = messageList;
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        isCommentsLoading.value = false;
      } else {
        // OverlayLoadingProgress.stop();
        isCommentsLoading.value = false;
        Get.snackbar(
          'Error',
          'comments failed to fetch. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      isCommentsLoading.value = false;
      Get.snackbar(
        'Opps!!!',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      isCommentsLoading.value = false;
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
      isCommentsLoading.value = false;
    } finally {
      // OverlayLoadingProgress.stop();
      isCommentsLoading.value = false;
    }
  }

  Future<void> makeComment() async {
    if (messageController.text.trim().isEmpty) return; // Validate input

    isCommentsSendLoading.value = true;
    String messageText = messageController.text.trim();

    // Create optimistic message
    final optimisticMessage = Messages(
      messageText: messageText,
      messageID: DateTime.now().millisecondsSinceEpoch,
      senderType: 4,
      sentAt: DateTime.now().toString(),
    );

    // Add to list immediately for optimistic UI
    tempMessageList.insert(0, optimisticMessage);
    messageController.clear();
    try {
      Map<String, dynamic> body = {"messageText": messageText};
      final response = await _apiService.makeComment(
        body,
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        formatDate1(datex.toString()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success - refresh to get server data
        // await getCommets();
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        // Remove optimistic message on auth/not found errors
        //  tempMessageList.remove(optimisticMessage);
        tempMessageList.removeWhere(
          (msg) => msg.messageID == optimisticMessage.messageID,
        );
        Get.snackbar(
          'Error',
          'Unable to send comment. Please check your permissions.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Remove optimistic message on other errors
        tempMessageList.remove(optimisticMessage);
        Get.snackbar(
          'Error',
          'Comment failed to send. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on SocketException {
      // Remove optimistic message on network error
      tempMessageList.remove(optimisticMessage);
      Get.snackbar(
        'No Internet',
        'Check your internet connection and try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0XFFFF8C42),
        colorText: Colors.white,
      );
    } catch (e) {
      // Remove optimistic message on unexpected error
      tempMessageList.remove(optimisticMessage);
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Comment error: $e'); // Log for debugging
    } finally {
      isCommentsSendLoading.value = false;
    }
  }

  String formatDate1(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  //TODO: STARTS HERE ==========================================

  RxBool isLoadingx = false.obs;
  RxBool isDownloading = false.obs;
  RxBool isSharing = false.obs;
  RxString localFilePath = ''.obs;

  final String reportCardEndpoint = 'https://your-api.com/api/report-card';

  // Get auth token from your storage
  //String authToken =  studentDataBase.getToken() ?? '';

  // Download PDF and open it with phone's default PDF viewer
  Future<void> downloadAndOpen(String reportCardType) async {
    print('object');
    try {
      isDownloading.value = true;

      // // Request storage permission
      // if (Platform.isAndroid) {
      //   myLog.log('platform is android');
      //   //await Permission.manageExternalStorage.request();
      //   if (await Permission.manageExternalStorage.isDenied) {
      //     await Permission.manageExternalStorage.request();
      //     myLog.log('requesting permission');
      //   }
      //   if (await Permission.storage.isDenied) {
      //     await Permission.storage.request();
      //     myLog.log('requesting permission Denied');
      //   }
      // }

      myLog.log(
        'student id ${dashboardExtendedViewController.selectedStudent1!.studentID.toString()}',
      );
      myLog.log(
        'student batch id ${dashboardExtendedViewController.studentBatchObj.data!.first.batchID}',
      );
      myLog.log('student report card type $reportCardType,');

      // Download the PDF
      final response = await _apiService.downloadAndOpen(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        dashboardExtendedViewController.studentBatchObj.data!.first.batchID
            .toString(),
        reportCardType,
      );

      if (response.statusCode == 200) {
        // Get downloads directory
        Directory? directory;
        if (Platform.isAndroid) {
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            directory = await getExternalStorageDirectory();
          }
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        }

        final fileName =
            'report_card_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final filePath = '${directory!.path}/$fileName';

        // Write PDF bytes to file
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        isDownloading.value = false;
        localFilePath.value = filePath;

        // Show success message
        Get.snackbar(
          'Success',
          'Report card downloaded successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );

        // Open the PDF with default viewer
        await OpenFile.open(filePath);
      } else {
        isDownloading.value = false;
        Get.snackbar(
          'Error',
          'Failed to download PDF. Status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      myLog.log(e.toString());
      isDownloading.value = false;
      Get.snackbar(
        'Error',
        'Failed to download PDF: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Share PDF via WhatsApp, Email, etc.
  Future<void> sharePDF(String reportCardType) async {
    try {
      isSharing.value = true;

      // Download the PDF to temp directory first
      final response = await _apiService.downloadAndShare(
        dashboardExtendedViewController.selectedStudent1!.studentID.toString(),
        dashboardExtendedViewController.studentBatchObj.data!.first.batchID
            .toString(),
        reportCardType,
      );

      if (response.statusCode == 200) {
        // Get temp directory
        final dir = await getTemporaryDirectory();
        final fileName =
            'report_card_${DateTime.now().millisecondsSinceEpoch}.pdf';
        final file = File('${dir.path}/$fileName');

        // Write PDF bytes to file
        await file.writeAsBytes(response.bodyBytes);

        isSharing.value = false;

        // Share the PDF
        await Share.shareXFiles(
          [XFile(file.path)],
          text: 'Report Card',
          subject: 'Student Report Card',
        );
      } else {
        isSharing.value = false;
        Get.snackbar(
          'Error',
          'Failed to load PDF. Status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isSharing.value = false;
      Get.snackbar(
        'Error',
        'Failed to share PDF: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
