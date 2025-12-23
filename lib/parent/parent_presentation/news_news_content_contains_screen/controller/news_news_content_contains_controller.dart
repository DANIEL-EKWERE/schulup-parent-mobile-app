import 'dart:io';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:schulupparent/parent/core/utils/storage.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';
import 'package:schulupparent/parent/parent_presentation/academics_assignment_answer_screen/models/reply_model.dart';
import 'package:share_plus/share_plus.dart';
import '../../../core/app_export.dart';
import '../models/news_news_content_contains_model.dart';

/// A controller class for the NewsNewsContentContainsScreen.
///
/// This class manages the state of the NewsNewsContentContainsScreen, including the
/// current newsNewsContentContainsModelObj
class NewsNewsContentContainsController extends GetxController {
  Rx<NewsNewsContentContainsModel> newsNewsContentContainsModelObj =
      NewsNewsContentContainsModel().obs;

Rx<bool> isLoading = false.obs;

ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

       final String baseUrl = 'https://your-api.com'; // Your base URL
  RxMap<String, bool> downloadingMap = <String, bool>{}.obs;
  
  

  // Download and open attachment
  Future<void> downloadAndOpenAttachment(String downloadUrl, String attachmentName) async {
  //  String authToken = await dataBase.getToken() ?? '';
    try {
    //  downloadingMap[attachment.fileName!] = true;
isLoading.value = true;
      // Construct full URL
     // final fullUrl = '$baseUrl/${downloadUrl}';
      
      // Download the file
      final response = await _apiService.downloadAndViewAttachment(downloadUrl);

      if (response.statusCode == 200) {
        isLoading.value = false;
        // Get app's directory
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/${attachmentName}';

        // Write file bytes
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

       // downloadingMap[attachment.fileNameAndExtention] = false;

        // Show success with option to open
        Get.snackbar(
          'Success',
          'File downloaded successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
          mainButton: TextButton(
            onPressed: () async {
              // Share to open with any app
              await Share.shareXFiles(
                [XFile(filePath)],
                text: attachmentName,
              );
            },
            child: Text('OPEN', style: TextStyle(color: Colors.white)),
          ),
        );

      } else {
        isLoading.value = false;
       // downloadingMap[attachment.fileNameAndExtention] = false;
        Get.snackbar(
          'Error',
          'Failed to download file. Status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

    } catch (e) {
      isLoading.value = false;
      myLog.log("Download error: ${e.toString()}");
     // downloadingMap[attachment.fileNameAndExtention] = false;
      Get.snackbar(
        'Error',
        'Failed to download: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}
