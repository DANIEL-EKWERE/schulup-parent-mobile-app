import 'dart:convert';

// Top-level function to parse JSON string
DailyReport dailyReportFromJson(String str) =>
    DailyReport.fromJson(json.decode(str));

// Top-level function to convert to JSON string
String dailyReportToJson(DailyReport data) =>
    json.encode(data.toJson());

class DailyReport {
  final bool success;
  final String message;
  final List<DailyReportDate> data;
  final Pagination? pagination;

  DailyReport({
    required this.success,
    required this.message,
    required this.data,
    this.pagination,
  });

  factory DailyReport.fromJson(Map<String, dynamic> json) {
    return DailyReport(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? (json['data'] as List).map((v) => DailyReportDate.fromJson(v)).toList()
          : [],
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((v) => v.toJson()).toList(),
      if (pagination != null) 'pagination': pagination!.toJson(),
    };
  }

  // Helper method to check if there are reports
  bool get hasReports => data.isNotEmpty;

  // Helper method to get total count
  int get totalReports => pagination?.total ?? data.length;
}

class DailyReportDate {
  final int dailyReportId;
  final int studentID;
  final String studentName;
  final int batchID;
  final String batchName;
  final DateTime reportDate;
  final String reportTopic;
  final String reportComment;
  final int createdBy;
  final String teachersName;
  final DateTime createdOn;

  DailyReportDate({
    required this.dailyReportId,
    required this.studentID,
    required this.studentName,
    required this.batchID,
    required this.batchName,
    required this.reportDate,
    required this.reportTopic,
    required this.reportComment,
    required this.createdBy,
    required this.teachersName,
    required this.createdOn,
  });

  factory DailyReportDate.fromJson(Map<String, dynamic> json) {
    return DailyReportDate(
      dailyReportId: json['dailyReportId'] ?? 0,
      studentID: json['studentID'] ?? 0,
      studentName: json['studentName'] ?? '',
      batchID: json['batchID'] ?? 0,
      batchName: json['batchName'] ?? '',
      reportDate: _parseDate(json['reportDate']),
      reportTopic: json['reportTopic'] ?? '',
      reportComment: json['reportComment'] ?? '',
      createdBy: json['createdBy'] ?? 0,
      teachersName: json['teachersName'] ?? '',
      createdOn: _parseDate(json['createdOn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyReportId': dailyReportId,
      'studentID': studentID,
      'studentName': studentName,
      'batchID': batchID,
      'batchName': batchName,
      'reportDate': reportDate.toIso8601String(),
      'reportTopic': reportTopic,
      'reportComment': reportComment,
      'createdBy': createdBy,
      'teachersName': teachersName,
      'createdOn': createdOn.toIso8601String(),
    };
  }

  // Helper method to parse dates
  static DateTime _parseDate(dynamic date) {
    if (date == null) return DateTime.now();
    if (date is DateTime) return date;
    try {
      return DateTime.parse(date.toString());
    } catch (e) {
      return DateTime.now();
    }
  }

  // Helper method to format report date
  String get formattedReportDate {
    return "${reportDate.day}/${reportDate.month}/${reportDate.year}";
  }

  // Helper method to format created date
  String get formattedCreatedOn {
    return "${createdOn.day}/${createdOn.month}/${createdOn.year}";
  }

  // Copy with method for easy updates
  DailyReportDate copyWith({
    int? dailyReportId,
    int? studentID,
    String? studentName,
    int? batchID,
    String? batchName,
    DateTime? reportDate,
    String? reportTopic,
    String? reportComment,
    int? createdBy,
    String? teachersName,
    DateTime? createdOn,
  }) {
    return DailyReportDate(
      dailyReportId: dailyReportId ?? this.dailyReportId,
      studentID: studentID ?? this.studentID,
      studentName: studentName ?? this.studentName,
      batchID: batchID ?? this.batchID,
      batchName: batchName ?? this.batchName,
      reportDate: reportDate ?? this.reportDate,
      reportTopic: reportTopic ?? this.reportTopic,
      reportComment: reportComment ?? this.reportComment,
      createdBy: createdBy ?? this.createdBy,
      teachersName: teachersName ?? this.teachersName,
      createdOn: createdOn ?? this.createdOn,
    );
  }
}

class Pagination {
  final int currentPage;
  final int pageSize;
  final int total;
  final int totalPages;

  Pagination({
    required this.currentPage,
    required this.pageSize,
    required this.total,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'] ?? 1,
      pageSize: json['pageSize'] ?? 10,
      total: json['total'] ?? 0,
      totalPages: json['totalPages'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'pageSize': pageSize,
      'total': total,
      'totalPages': totalPages,
    };
  }

  // Helper methods
  bool get hasNextPage => currentPage < totalPages;
  bool get hasPreviousPage => currentPage > 1;
  int get nextPage => hasNextPage ? currentPage + 1 : currentPage;
  int get previousPage => hasPreviousPage ? currentPage - 1 : currentPage;

  // Copy with method
  Pagination copyWith({
    int? currentPage,
    int? pageSize,
    int? total,
    int? totalPages,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

// // USAGE EXAMPLES:

// // 1. Parse from JSON string (API response)
// void parseFromStringExample() {
//   String jsonString = '''
//   {
//     "success": true,
//     "message": "Successful!",
//     "data": [
//       {
//         "dailyReportId": 1,
//         "studentID": 101,
//         "studentName": "John Doe",
//         "batchID": 5,
//         "batchName": "Grade 10A",
//         "reportDate": "2024-12-05",
//         "reportTopic": "Mathematics",
//         "reportComment": "Good progress",
//         "createdBy": 1,
//         "teachersName": "Mrs. Smith",
//         "createdOn": "2024-12-05T10:30:00"
//       }
//     ],
//     "pagination": {
//       "currentPage": 1,
//       "pageSize": 10,
//       "total": 50,
//       "totalPages": 5
//     }
//   }
//   ''';

//   // Use the top-level function
//   DailyReport report = dailyReportFromJson(jsonString);
  
//   print('Success: ${report.success}');
//   print('Message: ${report.message}');
//   print('Total Reports: ${report.totalReports}');
  
//   // Convert back to JSON string
//   String jsonOutput = dailyReportToJson(report);
//   print('JSON Output: $jsonOutput');
// }

// // 2. Parse from Map (already decoded JSON)
// void parseFromMapExample() {
//   Map<String, dynamic> jsonResponse = {
//     "success": true,
//     "message": "Successful!",
//     "data": [
//       {
//         "dailyReportId": 1,
//         "studentID": 101,
//         "studentName": "John Doe",
//         "batchID": 5,
//         "batchName": "Grade 10A",
//         "reportDate": "2024-12-05",
//         "reportTopic": "Mathematics",
//         "reportComment": "Good progress",
//         "createdBy": 1,
//         "teachersName": "Mrs. Smith",
//         "createdOn": "2024-12-05T10:30:00"
//       }
//     ],
//     "pagination": {
//       "currentPage": 1,
//       "pageSize": 10,
//       "total": 50,
//       "totalPages": 5
//     }
//   };

//   // Use the factory constructor directly
//   DailyReport report = DailyReport.fromJson(jsonResponse);
  
//   print('Success: ${report.success}');
//   print('Total Reports: ${report.totalReports}');
//   print('Has Reports: ${report.hasReports}');
  
//   for (var data in report.data) {
//     print('Student: ${data.studentName}');
//     print('Date: ${data.formattedReportDate}');
//   }
  
//   if (report.pagination != null) {
//     print('Page ${report.pagination!.currentPage} of ${report.pagination!.totalPages}');
//     print('Has next page: ${report.pagination!.hasNextPage}');
//   }
// }

// // 3. Real API call example
// Future<void> apiCallExample() async {
//   // Simulating an API response
//   final response = await http.get(Uri.parse('https://api.example.com/daily-reports'));
  
//   if (response.statusCode == 200) {
//     // Parse directly from response body string
//     DailyReport report = dailyReportFromJson(response.body);
    
//     // Use the data
//     for (var reportData in report.data) {
//       print('${reportData.studentName}: ${reportData.reportTopic}');
//     }
//   }
// }

// // 4. Filter reports by date
// List<DailyReportDate> filterByDate(DailyReport report, DateTime targetDate) {
//   return report.data.where((data) {
//     return data.reportDate.year == targetDate.year &&
//            data.reportDate.month == targetDate.month &&
//            data.reportDate.day == targetDate.day;
//   }).toList();
// }

// // 5. Group reports by student
// Map<String, List<DailyReportDate>> groupByStudent(DailyReport report) {
//   Map<String, List<DailyReportDate>> grouped = {};
  
//   for (var data in report.data) {
//     if (!grouped.containsKey(data.studentName)) {
//       grouped[data.studentName] = [];
//     }
//     grouped[data.studentName]!.add(data);
//   }
  
//   return grouped;
// }

// // 6. Find report by ID
// DailyReportDate? findReportById(DailyReport report, int id) {
//   try {
//     return report.data.firstWhere((data) => data.dailyReportId == id);
//   } catch (e) {
//     return null;
//   }
// }