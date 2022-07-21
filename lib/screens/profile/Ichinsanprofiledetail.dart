import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/model/profile/Ichinsanprofile.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constants/IchinsanColors.dart';
import '../../constants/Ichinsan_constant.dart';
import '../../constants/Ichinsan_string.dart';
import '../../constants/common.dart';
import '../../constants/size_config.dart';

import '../../main.dart';
import '../../widgets/appwidget.dart';
import '../../widgets/profile_widget/button_widget.dart';
import '../../widgets/profile_widget/profile_widget.dart';
import '../signin.dart';
import 'editingprofile/editprofile.dart';

class ProfileDetailScreen extends StatefulWidget {
  final IchinsanProfile userProfile;
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
    var skillList = widget.userProfile.languageSkill;
    return Scaffold(
        // backgroundColor: qIBus_app_background,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: appTextColorPrimary),
            onPressed: () {
              IchinsanCommon.itemNavigatorPushAndRemove(
                  (context) => IchinsanPage(
                        index: 2,
                        title: 'Ichinsan-MobileApp',
                      ),
                  context);
            },
          ),
          title: const Align(
            alignment: Alignment.topCenter,
            child: Text(Ichinsan_title_your_proflie),
          ),
        ),
        body: Container(
          height: context.height(),
          width: context.width(),
          padding: const EdgeInsets.only(top: spacing_xxLarge),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
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
                                avatarImage: widget.userProfile.avatarImage!,
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
                                    Text(widget.userProfile.fullName!,
                                        style: boldTextStyle()),
                                    Text(widget.userProfile.role!,
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
                                rowHeading(Ichinsan_label_dob,
                                    widget.userProfile.getDob),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 10, 16, 0),
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
                                  widget.userProfile.phoneNumber),
                              view().paddingOnly(
                                  left: 16, top: 8, right: 16, bottom: 8),
                              8.height,
                              //Email
                              rowHeading(Ichinsan_label_email,
                                  widget.userProfile.email),
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
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(widget.userProfile.aboutMe ??
                                        Ichinsan_label_unknown)),
                              )
                            ],
                          ),
                        ),
                      ),
                      10.height,
                      Center(
                        child: GestureDetector(
                          child: ButtonWidget(
                              onClicked: () async {
                                IchinsanCommon.itemNavigator(
                                    (context) => EditProfile(
                                        userProfile: widget.userProfile),
                                    context);
                              },
                              text: Inchisan_label_edit),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
