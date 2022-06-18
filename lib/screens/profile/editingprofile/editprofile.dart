import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../model/profile.dart';
import 'InchinsanProfileDetail_edit.dart';

class EditProfile extends StatefulWidget {
  late Profile userProfile;
  EditProfile({Key? key, required this.userProfile}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: EditProfileDetail(
        form: formKey,
        userProfile: widget.userProfile,
        onChanged: (value) => setState(() {
          widget.userProfile = value;
        }),
      )),
    );
  }
}
