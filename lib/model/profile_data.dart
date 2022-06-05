import 'package:ichinsan_mobile/model/profile.dart';
import 'package:ichinsan_mobile/model/skill.dart';

class Profile_Data {
  static String? avatarImage;
  static String? email;

  static List<Skill> list = [
    new Skill.withDetails('Vietnamese', 'Fluent'),
    new Skill.withDetails('English', 'Intermediate')
  ];
  static var myProfile = Profile.withDetails(
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
      avatarImage!,
      'Not Yet',
      'Not Yet',
      'Not Yet',
      email!,
      DateTime.utc(2001, 1, 1),
      'Not Yet',
      'Not Yet',
      list,
      'Not Yet');
}
