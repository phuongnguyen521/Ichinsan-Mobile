import 'package:ichinsan_mobile/model/profile.dart';
import 'package:ichinsan_mobile/model/skill.dart';

class Profile_Data {
  static String? id;
  static String? avatarImage;
  static String? email;

  static List<Skill> list = [
    new Skill.withDetails('Vietnamese', 'Fluent'),
    new Skill.withDetails('English', 'Intermediate')
  ];
  static var myProfile = Profile.withDetails(
      id!,
      avatarImage!,
      'Translator',
      'Beginner',
      'Nguyen Ngoc Phuong',
      email!,
      DateTime.utc(2001, 1, 1),
      'female',
      '0101010101',
      list,
      'This is about me');

  static var myDefaultProfile = Profile.withDetails(
      id!,
      avatarImage!,
      'Not Yet',
      'Not Yet',
      'Unknown',
      email!,
      DateTime.utc(2001, 1, 1),
      'Not Yet',
      'Not Yet',
      list,
      'Not Yet');
}
