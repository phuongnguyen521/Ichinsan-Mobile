import 'package:flutter/cupertino.dart';
import 'package:ichinsan_mobile/model/skill.dart';
import 'package:intl/intl.dart';

@immutable
class Profile {
  late String id;
  late String avatarImage;
  late String role;
  late String level;
  late String fullName;
  late String email;
  late String gender;
  late String phonenumber;
  late DateTime dob;
  late List<Skill> skillList;
  late String aboutMe;

  Profile copyWith({DateTime? dob, String? aboutMe}) {
    dob ??= this.dob;
    aboutMe = aboutMe ?? this.aboutMe;
    return Profile.withDetails(id, avatarImage, role, level, fullName, email,
        dob, gender, phonenumber, skillList, aboutMe);
  }

  Profile.withDetails(
      this.id,
      this.avatarImage,
      this.role,
      this.level,
      this.fullName,
      this.email,
      this.dob,
      this.gender,
      this.phonenumber,
      this.skillList,
      this.aboutMe);
  bool get birthDateIsValid => _birthDateValidator(dob) == null;

  String get getDob => DateFormat.yMMMMd().format(dob).toString();

  bool isValid() => birthDateIsValid;

  String? _birthDateValidator(DateTime dob) {
    final now = DateTime.now();
    if (dob == null) {
      return "Date of birth is required";
    }

    if (dob.isBefore(DateTime(now.year, now.month, now.day))) {
      return "Date of birth cannot be in the future";
    }
  }
}
