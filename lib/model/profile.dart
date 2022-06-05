import 'package:ichinsan_mobile/model/skill.dart';

class Profile {
  String avatarImage;
  String role;
  String level;
  String fullName;
  String email;
  String gender;
  String phonenumber;
  DateTime dob;
  List<Skill> list;
  String aboutMe;

  Profile.withDetails(
      this.avatarImage,
      this.role,
      this.level,
      this.fullName,
      this.email,
      this.dob,
      this.gender,
      this.phonenumber,
      this.list,
      this.aboutMe);
}
