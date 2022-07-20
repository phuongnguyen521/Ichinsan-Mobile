import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/model/profile/Ichinsanprofile.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../constants/IchinsanColors.dart';
import '../../../constants/Ichinsan_string.dart';
import '../../../constants/common.dart';
import '../../../main.dart';
import '../../../model/profile/profile.dart';
import '../../../widgets/profile_widget/button_widget.dart';
import '../profilescreen.dart';
import 'InchinsanProfileDetail_edit.dart';

class EditProfile extends StatefulWidget {
  late IchinsanProfile userProfile;
  EditProfile({Key? key, required this.userProfile}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditProfileDetail(
        form: formKey,
        userProfile: widget.userProfile,
        onChanged: (value) => setState(() {
          widget.userProfile = value;
        }),
      ),
    );
  }
}
