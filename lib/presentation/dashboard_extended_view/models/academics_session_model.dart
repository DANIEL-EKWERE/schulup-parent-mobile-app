import 'dart:convert';

AcademicSession academicSessionFromJson(String str) =>
    AcademicSession.fromJson(json.decode(str));

String academicSessionToJson(AcademicSession data) =>
    json.encode(data.toJson());

class AcademicSession {
  bool? success;
  String? message;
  List<AcademicSessionData>? data;

  AcademicSession({
    this.success,
    this.message,
    this.data,
  });

  AcademicSession.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AcademicSessionData>[];
      json['data'].forEach((v) {
        data!.add(AcademicSessionData.fromJson(v));
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

class AcademicSessionData {
  int? academicSessionID;
  String? name;

  AcademicSessionData({
    this.academicSessionID,
    this.name,
  });

  AcademicSessionData.fromJson(Map<String, dynamic> json) {
    academicSessionID = json['academicSessionID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['academicSessionID'] = academicSessionID;
    data['name'] = name;
    return data;
  }

  // Helper method to extract year range from session name
  String get yearRange {
    if (name == null) return '';
    // Handles formats like "2024-2025", "2024/2025", "2024 - 2025"
    final RegExp yearPattern = RegExp(r'(\d{4})');
    final matches = yearPattern.allMatches(name!);
    if (matches.length >= 2) {
      return '${matches.first.group(0)} - ${matches.last.group(0)}';
    }
    return name ?? '';
  }

  // Helper method to check if session is current based on name
  bool get isCurrent {
    if (name == null) return false;
    final currentYear = DateTime.now().year;
    return name!.contains(currentYear.toString());
  }

  // Helper method to get short display name (e.g., "24/25")
  String get shortName {
    if (name == null) return '';
    final RegExp yearPattern = RegExp(r'(\d{4})');
    final matches = yearPattern.allMatches(name!);
    if (matches.length >= 2) {
      final year1 = matches.first.group(0)!.substring(2);
      final year2 = matches.last.group(0)!.substring(2);
      return '$year1/$year2';
    }
    return name ?? '';
  }

  // Helper method to get start year
  int? get startYear {
    if (name == null) return null;
    final RegExp yearPattern = RegExp(r'(\d{4})');
    final match = yearPattern.firstMatch(name!);
    if (match != null) {
      return int.tryParse(match.group(0)!);
    }
    return null;
  }

  // Helper method to get end year
  int? get endYear {
    if (name == null) return null;
    final RegExp yearPattern = RegExp(r'(\d{4})');
    final matches = yearPattern.allMatches(name!);
    if (matches.length >= 2) {
      return int.tryParse(matches.last.group(0)!);
    }
    return null;
  }
}