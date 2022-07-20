import 'package:ichinsan_mobile/model/profile/Ichinsanprofile.dart';
import 'package:ichinsan_mobile/model/profile/profile.dart';
import 'package:ichinsan_mobile/model/skill.dart';

import '../../constants/Ichinsan_string.dart';

class Profile_Data {
  static String? id;
  static String? avatarImage;
  static String? email;
  static late IchinsanProfile profile;

  static List<Skill> listdetail = [
    Skill.withDetails('VietNam', 'Fluent'),
    Skill.withDetails('English', 'Intermediate')
  ];

  static List<Skill> list = [];
  static var myProfile = IchinsanProfile(
      id: id!,
      avatarImage: avatarImage!,
      balance: 0,
      birthday: DateTime.now(),
      email: email!,
      fullName: 'Nguyen Ngoc Phuong',
      gender: 'Female',
      languageSkill: listdetail,
      phoneNumber: '0101010112',
      role: 'Translator',
      technique: 'Beginner',
      website: Ichinsan_label_unknown,
      aboutMe: 'This is about me');
  static var myIchinsanProfile = IchinsanProfile(
      id: profile.id,
      avatarImage: profile.avatarImage ?? avatarImage,
      balance: profile.balance,
      birthday: profile.birthday,
      email: profile.email,
      fullName: profile.fullName,
      gender: profile.gender,
      languageSkill: listdetail,
      phoneNumber: profile.phoneNumber,
      role: profile.role,
      technique: 'Beginner',
      website: profile.website,
      aboutMe: profile.aboutMe);

  static var myDefaultProfile = IchinsanProfile(
      id: id!,
      avatarImage: avatarImage!,
      balance: 0,
      birthday: DateTime.now(),
      email: email!,
      fullName: Ichinsan_label_unknown,
      gender: Ichinsan_label_unknown,
      languageSkill: [],
      phoneNumber: Ichinsan_label_unknown,
      role: Ichinsan_label_unknown,
      technique: Ichinsan_label_unknown,
      website: Ichinsan_label_unknown,
      aboutMe: Ichinsan_label_unknown);
}
