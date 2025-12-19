// TODO Implement this library.
import 'dart:convert';

/// This class is used in the [academics_assignment_status_initial_page] screen.

AcademicsAssignmentStatusInitialModel
academicsAssignmentStatusInitialModelFromJson(String str) =>
    AcademicsAssignmentStatusInitialModel.fromJson(json.decode(str));

String academicsAssignmentStatusInitialModelToJson(
  AcademicsAssignmentStatusInitialModel data,
) => json.encode(data.toJson());

class AcademicsAssignmentStatusInitialModel {
  final bool? success;
  final String? message;
  final List<Student>? data;

  AcademicsAssignmentStatusInitialModel({
    this.success,
    this.message,
    this.data,
  });

  AcademicsAssignmentStatusInitialModel.fromJson(Map<String, dynamic> json)
    : success = json['success'],
      message = json['message'],
      data =
          json['data'] != null
              ? (json['data'] as List).map((v) => Student.fromJson(v)).toList()
              : null;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      if (data != null) 'data': data!.map((v) => v.toJson()).toList(),
    };
  }
}

class Student {
   int? studentID;
  final String? admissionNo;
  final String? lastName;
   String? firstName;
  final String? middleName;
  final String? gender;
  final String? dateAdmitted;
  final String? dateOfBirth;
  final String? religion;
  final String? bloodGroup;
  final String? genotype;
  final String? country;
  final String? state;
  final String? city;
  final String? address;
  final String? birthPlace;
  final String? language;
  final String? className;
  String? profilePicBase64;
  final bool? hasProfilePic;

  Student({
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

  Student.fromJson(Map<String, dynamic> json)
    : studentID = json['studentID'],
      admissionNo = json['admissionNo'],
      lastName = json['lastName'],
      firstName = json['firstName'],
      middleName = json['middleName'],
      gender = json['gender'],
      dateAdmitted = json['dateAdmitted'],
      dateOfBirth = json['dateOfBirth'],
      religion = json['religion'],
      bloodGroup = json['bloodGroup'],
      genotype = json['genotype'],
      country = json['country'],
      state = json['state'],
      city = json['city'],
      address = json['address'],
      birthPlace = json['birthPlace'],
      language = json['language'],
      className = json['className'],
      profilePicBase64 = json['profilePicBase64'],
      hasProfilePic = json['hasProfilePic'];

  Map<String, dynamic> toJson() {
    return {
      'studentID': studentID,
      'admissionNo': admissionNo,
      'lastName': lastName,
      'firstName': firstName,
      'middleName': middleName,
      'gender': gender,
      'dateAdmitted': dateAdmitted,
      'dateOfBirth': dateOfBirth,
      'religion': religion,
      'bloodGroup': bloodGroup,
      'genotype': genotype,
      'country': country,
      'state': state,
      'city': city,
      'address': address,
      'birthPlace': birthPlace,
      'language': language,
      'className': className,
      'profilePicBase64': profilePicBase64,
      'hasProfilePic': hasProfilePic,
    };
  }
}
