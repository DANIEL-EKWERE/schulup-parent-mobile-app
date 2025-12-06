import 'dart:convert';

import 'package:flutter/material.dart';

// Top-level helper functions
StudentProfile studentProfileFromJson(String str) =>
    StudentProfile.fromJson(json.decode(str));
String studentProfileToJson(StudentProfile data) => json.encode(data.toJson());

class StudentProfile {
  bool? success;
  String? message;
  Data? data;

  StudentProfile({this.success, this.message, this.data});

  StudentProfile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  // Helper methods
  bool get isSuccessful => success ?? false;
  bool get hasData => data != null;
}

class Data {
  int? studentID;
  String? admissionNo;
  String? lastName;
  String? firstName;
  String? middleName;
  String? gender;
  String? dateAdmitted;
  String? dateOfBirth;
  String? religion;
  String? bloodGroup;
  String? genotype;
  String? country;
  String? state;
  String? city;
  String? address;
  String? birthPlace;
  String? language;
  String? className;
  String? profilePicBase64;
  bool? hasProfilePic;

  Data({
    this.studentID,
    this.admissionNo,
    this.lastName,
    this.firstName,
    this.middleName,
    this.gender,
    this.dateAdmitted,
    this.dateOfBirth,
    this.religion,
    this.bloodGroup,
    this.genotype,
    this.country,
    this.state,
    this.city,
    this.address,
    this.birthPlace,
    this.language,
    this.className,
    this.profilePicBase64,
    this.hasProfilePic,
  });

  Data.fromJson(Map<String, dynamic> json) {
    studentID = json['studentID'];
    admissionNo = json['admissionNo'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    gender = json['gender'];
    dateAdmitted = json['dateAdmitted'];
    dateOfBirth = json['dateOfBirth'];
    religion = json['religion'];
    bloodGroup = json['bloodGroup'];
    genotype = json['genotype'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    birthPlace = json['birthPlace'];
    language = json['language'];
    className = json['className'];
    profilePicBase64 = json['profilePicBase64'];
    hasProfilePic = json['hasProfilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['studentID'] = studentID;
    data['admissionNo'] = admissionNo;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['gender'] = gender;
    data['dateAdmitted'] = dateAdmitted;
    data['dateOfBirth'] = dateOfBirth;
    data['religion'] = religion;
    data['bloodGroup'] = bloodGroup;
    data['genotype'] = genotype;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['address'] = address;
    data['birthPlace'] = birthPlace;
    data['language'] = language;
    data['className'] = className;
    data['profilePicBase64'] = profilePicBase64;
    data['hasProfilePic'] = hasProfilePic;
    return data;
  }

  // Helper methods
  String get fullName {
    final names = [firstName, middleName, lastName]
        .where((name) => name != null && name.isNotEmpty)
        .join(' ');
    return names.isEmpty ? 'Unknown' : names;
  }

  String get initials {
    String first = firstName?.isNotEmpty == true ? firstName![0] : '';
    String last = lastName?.isNotEmpty == true ? lastName![0] : '';
    return '$first$last'.toUpperCase();
  }

  DateTime? get dateOfBirthDateTime {
    if (dateOfBirth == null) return null;
    try {
      return DateTime.parse(dateOfBirth!);
    } catch (e) {
      return null;
    }
  }

  DateTime? get dateAdmittedDateTime {
    if (dateAdmitted == null) return null;
    try {
      return DateTime.parse(dateAdmitted!);
    } catch (e) {
      return null;
    }
  }

  int? get age {
    final dob = dateOfBirthDateTime;
    if (dob == null) return null;
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month || 
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  String get formattedDateOfBirth {
    final date = dateOfBirthDateTime;
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }

  String get formattedDateAdmitted {
    final date = dateAdmittedDateTime;
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }

  bool get isMale => gender?.toLowerCase() == 'male';
  bool get isFemale => gender?.toLowerCase() == 'female';

  String get fullAddress {
    final parts = [address, city, state, country]
        .where((part) => part != null && part.isNotEmpty)
        .join(', ');
    return parts.isEmpty ? 'N/A' : parts;
  }

  // Profile picture as ImageProvider
  ImageProvider? get profilePicture {
    if (hasProfilePic == true && profilePicBase64 != null) {
      try {
        return MemoryImage(base64Decode(profilePicBase64!));
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}