import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/screens/profile/profilescreen.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constants/IchinsanColors.dart';
import '../../constants/Ichinsan_constant.dart';
import '../../constants/Ichinsan_string.dart';
import '../../constants/common.dart';
import '../../constants/size_config.dart';

import '../../model/profile.dart';
import '../../widgets/appwidget.dart';
import '../../widgets/profile_widget/button_widget.dart';
import '../../widgets/profile_widget/profile_widget.dart';
import 'editingprofile/editprofile.dart';

class ProfileDetailScreen extends StatefulWidget {
  final Profile userProfile;
  ProfileDetailScreen({required this.userProfile});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  String? _selectedLocation = 'Male';

  Row rowHeading1(var label) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: text(label, fontFamily: fontMedium)),
      ],
    );
  }

  Widget rowHeading(var label, var subLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: text(label,
                fontSize: textSizeSMedium, textColor: appTextColorSecondary),
          ),
          Expanded(
              flex: 3,
              child: text(subLabel,
                  fontSize: textSizeSMedium, textColor: appTextColorSecondary))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var skillList = widget.userProfile.skillList;
    return Scaffold(
        // backgroundColor: qIBus_app_background,
        body: Container(
      height: context.height(),
      width: context.width(),
      padding: EdgeInsets.only(top: spacing_xxLarge),
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //App bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: appTextColorPrimary),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => ProfileScreen())),
                              (route) => false);
                        },
                      ),
                      // ProfileWidget(
                      //   avatarImage: widget.userProfile.avatarImage,
                      //   onClicked: () async {},
                      // ),
                      GestureDetector(
                        child: ButtonWidget(
                            onClicked: () {
                              IchinsanCommon.itemNavigator(
                                  (context) => EditProfile(
                                      userProfile: widget.userProfile),
                                  context);
                            },
                            text: Inchisan_label_edit),
                      ),
                    ],
                  ),
                  //Avatar, fullname, role
                  Container(
                    margin: const EdgeInsets.only(
                        left: spacing_standard_new,
                        right: spacing_standard_new,
                        top: spacing_standard_new),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          spacing_standard,
                          spacing_standard,
                          spacing_standard,
                          spacing_standard_new),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileWidget(
                            avatarImage: widget.userProfile.avatarImage,
                            onClicked: () async {},
                            heightImage: 80,
                            widthImage: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: spacing_standard_new,
                                right: spacing_standard_new,
                                top: spacing_standard_new),
                            child: Column(
                              children: <Widget>[
                                Text(widget.userProfile.fullName,
                                    style: boldTextStyle()),
                                Text(widget.userProfile.role,
                                    style: secondaryTextStyle()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Personal
                  Container(
                      margin: const EdgeInsets.only(
                          left: spacing_standard_new,
                          right: spacing_standard_new,
                          top: spacing_standard_new),
                      decoration: boxDecoration(
                        showShadow: true,
                        bgColor: context.cardColor,
                        radius: spacing_middle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            spacing_standard,
                            spacing_standard,
                            spacing_standard,
                            spacing_standard_new),
                        child: Column(
                          children: <Widget>[
                            rowHeading1(Ichinsan_title_personal),
                            const SizedBox(height: spacing_standard),
                            //Gender
                            rowHeading(Ichinsan_label_gender,
                                widget.userProfile.gender),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 10, 16, 10),
                              child: view(),
                            ),
                            const SizedBox(height: 8),
                            //Date of Birth
                            rowHeading(
                                Ichinsan_label_dob, widget.userProfile.getDob),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                              child: view(),
                            ),
                          ],
                        ),
                      )),
                  //Contacts
                  Container(
                    margin: const EdgeInsets.only(
                        left: spacing_standard_new,
                        right: spacing_standard_new,
                        top: spacing_standard_new,
                        bottom: spacing_standard_new),
                    decoration: boxDecoration(
                      showShadow: true,
                      bgColor: context.cardColor,
                      radius: spacing_middle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          spacing_standard,
                          spacing_standard,
                          spacing_standard,
                          spacing_standard_new),
                      child: Column(
                        children: <Widget>[
                          rowHeading1(Ichinsan_title_contacts),
                          8.height,
                          //Phone number
                          rowHeading(Ichinsan_label_phone_number,
                              widget.userProfile.phonenumber),
                          view().paddingOnly(
                              left: 16, top: 8, right: 16, bottom: 8),
                          8.height,
                          //Email
                          rowHeading(
                              Ichinsan_label_email, widget.userProfile.email),
                        ],
                      ),
                    ),
                  ),
                  //Skills
                  Container(
                    margin: const EdgeInsets.only(
                        left: spacing_standard_new,
                        right: spacing_standard_new,
                        top: spacing_standard_new,
                        bottom: spacing_standard_new),
                    decoration: boxDecoration(
                      showShadow: true,
                      bgColor: context.cardColor,
                      radius: spacing_middle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          spacing_standard,
                          spacing_standard,
                          spacing_standard,
                          spacing_standard_new),
                      child: Column(
                        children: <Widget>[
                          rowHeading1(Ichinsan_title_skill),
                          8.height,
                          // GridView.builder(
                          //   itemCount: skillList.length,
                          //   itemBuilder: (context, index) => rowHeading(
                          //       skillList[index].languageName,
                          //       skillList[index].languageLevel),
                          //   gridDelegate:
                          //       const SliverGridDelegateWithFixedCrossAxisCount(
                          //           crossAxisCount: 2,
                          //           mainAxisSpacing: 20,
                          //           childAspectRatio: 1.65),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  //About me
                  Container(
                    margin: const EdgeInsets.only(
                        left: spacing_standard_new,
                        right: spacing_standard_new,
                        top: spacing_standard_new,
                        bottom: spacing_standard_new),
                    decoration: boxDecoration(
                      showShadow: true,
                      bgColor: context.cardColor,
                      radius: spacing_middle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          spacing_standard,
                          spacing_standard,
                          spacing_standard,
                          spacing_standard_new),
                      child: Column(
                        children: <Widget>[
                          rowHeading1(Ichinsan_label_about_me),
                          8.height,
                          Text(widget.userProfile.aboutMe)
                        ],
                      ),
                    ),
                  ),
                  16.height,
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
