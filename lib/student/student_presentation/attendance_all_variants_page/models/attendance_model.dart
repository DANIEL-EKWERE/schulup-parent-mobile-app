import 'dart:convert';
import 'package:intl/intl.dart';

Attendance attendanceFromJson(String str) =>
    Attendance.fromJson(json.decode(str));

String attendanceToJson(Attendance data) =>
    json.encode(data.toJson());

class Attendance {
  bool? success;
  String? message;
  List<AttendanceData>? data;

  Attendance({
    this.success,
    this.message,
    this.data,
  });

  Attendance.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AttendanceData>[];
      json['data'].forEach((v) {
        data!.add(AttendanceData.fromJson(v));
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

class AttendanceData {
  String? attendanceDate;
  List<AttendanceLogs>? attendanceLogs;

  AttendanceData({
    this.attendanceDate,
    this.attendanceLogs,
  });

  AttendanceData.fromJson(Map<String, dynamic> json) {
    attendanceDate = json['attendanceDate'];
    if (json['attendanceLogs'] != null) {
      attendanceLogs = <AttendanceLogs>[];
      json['attendanceLogs'].forEach((v) {
        attendanceLogs!.add(AttendanceLogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendanceDate'] = attendanceDate;
    if (attendanceLogs != null) {
      data['attendanceLogs'] = attendanceLogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // Helper method to format attendance date
  String get formattedDate {
    if (attendanceDate == null) return '';
    try {
      DateTime dateTime = DateTime.parse(attendanceDate!);
      return DateFormat('EEEE, MMM d, yyyy').format(dateTime);
    } catch (e) {
      return attendanceDate ?? '';
    }
  }

  // Helper method to get short date format
  String get shortDate {
    if (attendanceDate == null) return '';
    try {
      DateTime dateTime = DateTime.parse(attendanceDate!);
      return DateFormat('MMM d').format(dateTime);
    } catch (e) {
      return attendanceDate ?? '';
    }
  }

  // Helper method to check if there are any logs
  bool get hasLogs {
    return attendanceLogs != null && attendanceLogs!.isNotEmpty;
  }

  // Helper method to get check-in log
  AttendanceLogs? get checkInLog {
    if (!hasLogs) return null;
    return attendanceLogs!.firstWhere(
      (log) => log.eventType?.toLowerCase() == 'check-in',
      orElse: () => attendanceLogs!.first,
    );
  }

  // Helper method to get check-out log
  AttendanceLogs? get checkOutLog {
    if (!hasLogs) return null;
    try {
      return attendanceLogs!.firstWhere(
        (log) => log.eventType?.toLowerCase() == 'check-out',
      );
    } catch (e) {
      return null;
    }
  }

  // Helper method to check if student was present
  bool get wasPresent {
    return hasLogs && 
           attendanceLogs!.any((log) => 
             log.status?.toLowerCase() == 'present' ||
             log.eventType?.toLowerCase() == 'check-in');
  }
}

class AttendanceLogs {
  int? attendanceLogID;
  String? cardUID;
  String? personName;
  String? personType;
  String? eventType;
  String? eventDateTime;
  String? status;

  AttendanceLogs({
    this.attendanceLogID,
    this.cardUID,
    this.personName,
    this.personType,
    this.eventType,
    this.eventDateTime,
    this.status,
  });

  AttendanceLogs.fromJson(Map<String, dynamic> json) {
    attendanceLogID = json['attendanceLogID'];
    cardUID = json['cardUID'];
    personName = json['personName'];
    personType = json['personType'];
    eventType = json['eventType'];
    eventDateTime = json['eventDateTime'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendanceLogID'] = attendanceLogID;
    data['cardUID'] = cardUID;
    data['personName'] = personName;
    data['personType'] = personType;
    data['eventType'] = eventType;
    data['eventDateTime'] = eventDateTime;
    data['status'] = status;
    return data;
  }

  // Helper method to format event time
  String get formattedTime {
    if (eventDateTime == null) return '';
    try {
      DateTime dateTime = DateTime.parse(eventDateTime!);
      return DateFormat('h:mm a').format(dateTime);
    } catch (e) {
      return eventDateTime ?? '';
    }
  }

  // Helper method to format full event datetime
  String get formattedDateTime {
    if (eventDateTime == null) return '';
    try {
      DateTime dateTime = DateTime.parse(eventDateTime!);
      return DateFormat('MMM d, yyyy • h:mm a').format(dateTime);
    } catch (e) {
      return eventDateTime ?? '';
    }
  }

  // Helper method to format full event datetime
  String get formattedDateTime1 {
    if (eventDateTime == null) return '';
    try {
      DateTime dateTime = DateTime.parse(eventDateTime!);
      return DateFormat('h:mm a').format(dateTime);
    } catch (e) {
      return eventDateTime ?? '';
    }
  }
  // Helper method to check if this is a check-in event
  bool get isCheckIn {
    return eventType?.toLowerCase() == 'check-in';
  }

  // Helper method to check if this is a check-out event
  bool get isCheckOut {
    return eventType?.toLowerCase() == 'check-out';
  }

  // Helper method to check if status is present
  bool get isPresent {
    return status?.toLowerCase() == 'present';
  }

  // Helper method to check if status is absent
  bool get isAbsent {
    return status?.toLowerCase() == 'absent';
  }

  // Helper method to get person initials
  String get personInitials {
    if (personName == null || personName!.isEmpty) return '?';
    List<String> names = personName!.trim().split(' ');
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    return '${names.first[0]}${names.last[0]}'.toUpperCase();
  }

  // Helper method to check if this is a student
  bool get isStudent {
    return personType?.toLowerCase() == 'student';
  }

  // Helper method to check if this is a staff/teacher
  bool get isStaff {
    return personType?.toLowerCase() == 'staff' || 
           personType?.toLowerCase() == 'teacher';
  }
}