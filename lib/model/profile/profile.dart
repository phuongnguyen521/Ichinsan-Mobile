import 'package:flutter/cupertino.dart';
import 'package:ichinsan_mobile/model/skill.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

@immutable
class Profile {
  String? id;
  String? avatarImage;
  String? role;
  String? level;
  String? fullName;
  String? email;
  String? gender;
  String? phonenumber;
  DateTime? dob;
  String? technique;
  List<Skill> skillList;
  String? aboutMe;

  Profile copyWith({DateTime? dob, String? aboutMe, String? technique}) {
    dob ??= this.dob;
    aboutMe = aboutMe ?? this.aboutMe;
    technique = technique ?? this.technique;
    return Profile.withDetails(id, avatarImage, role, fullName, email, dob,
        gender, phonenumber, technique, skillList, aboutMe);
  }

  Profile.withDetails(
      this.id,
      this.avatarImage,
      this.role,
      this.fullName,
      this.email,
      this.dob,
      this.gender,
      this.phonenumber,
      this.technique,
      this.skillList,
      this.aboutMe);
  bool get birthDateIsValid => _birthDateValidator(dob!) == null;

  String get getDob => DateFormat.yMMMMd().format(dob!).toString();

  bool isValid() => birthDateIsValid;

  String? _birthDateValidator(DateTime dob) {
    final now = DateTime.now();
    if (dob == null) {
      return "Date of birth is ";
    }

    if (dob.isBefore(DateTime(now.year, now.month, now.day))) {
      return "Date of birth cannot be in the future";
    }
  }
}
