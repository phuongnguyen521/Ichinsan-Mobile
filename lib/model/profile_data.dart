import 'package:ichinsan_mobile/model/profile.dart';
import 'package:ichinsan_mobile/model/skill.dart';

import '../constants/Ichinsan_string.dart';

class Profile_Data {
  static String? id;
  static String? avatarImage;
  static String? email;

  static List<Skill> listdetail = [
    Skill.withDetails('VietNam', 'Fluent'),
    Skill.withDetails('English', 'Intermediate')
  ];

  static List<Skill> list = [];
  static var myProfile = Profile.withDetails(
      id!,
      avatarImage!,
      'Translator',
      'Beginner',
      'Nguyen Ngoc Phuong',
      email!,
      DateTime.utc(2001, 1, 1),
      'Female',
      '0101010101',
      listdetail,
      'This is about me');

  static var myDefaultProfile = Profile.withDetails(
      id!,
      avatarImage!,
      Ichinsan_label_unknown,
      Ichinsan_label_unknown,
      Ichinsan_label_unknown,
      email!,
      DateTime.utc(2001, 1, 1),
      Ichinsan_label_unknown,
      Ichinsan_label_unknown,
      list,
      Ichinsan_label_unknown);
}
