import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/size_config.dart';
import 'package:ichinsan_mobile/model/profile/Ichinsanprofile.dart';
import 'package:ichinsan_mobile/model/profile/profile_data.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../constants/IchinsanColors.dart';
import '../../../constants/Ichinsan_constant.dart';
import '../../../constants/Ichinsan_string.dart';
import '../../../constants/common.dart';
import '../../../main.dart';
import '../../../model/profile/profile.dart';
import '../../../model/profile/profile.dart';
import '../../../widgets/appwidget.dart';
import '../../../widgets/profile_widget/button_widget.dart';
import '../../../widgets/profile_widget/profile_widget.dart';
import '../../signin.dart';
import '../editingprofile/editprofile.dart';

class SkillDetailScreen extends StatefulWidget {
  final IchinsanProfile userProfile;
  // ignore: use_key_in_widget_constructors
  const SkillDetailScreen({required this.userProfile});

  @override
  State<SkillDetailScreen> createState() => _SkillDetailScreenState();
}

class _SkillDetailScreenState extends State<SkillDetailScreen> {
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
            flex: 3,
            child: text(label,
                fontSize: textSizeSMedium, textColor: appTextColorSecondary),
          ),
          Expanded(
              flex: 2,
              child: text(subLabel,
                  fontSize: textSizeSMedium, textColor: appTextColorSecondary))
        ],
      ),
    );
  }

  Widget columnHeading(var label, var subLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Column(
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
    IchinsanSizeConfig sizeConfig = IchinsanSizeConfig();
    sizeConfig.init(context);
    double? defaultSize = IchinsanSizeConfig.defaultSize;
    var skillList = Profile_Data.listdetail;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          alignment: Alignment.centerRight,
          child: Text(Ichinsan_title_skill),
        ),
      ),
      // backgroundColor: qIBus_app_background,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
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
                              avatarImage:
                                  widget.userProfile.avatarImage.toString(),
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
                                  Text(widget.userProfile.fullName.toString(),
                                      style: boldTextStyle()),
                                  Text(widget.userProfile.role.toString(),
                                      style: secondaryTextStyle()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Technique
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
                              rowHeading1(Ichinsan_label_technique),
                              const SizedBox(height: spacing_standard),
                              //Technique level
                              rowHeading(Ichinsan_label_level,
                                  widget.userProfile.technique),
                            ],
                          ),
                        )),
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
                        padding: const EdgeInsets.only(
                            left: spacing_standard_new,
                            right: spacing_standard_new,
                            top: spacing_standard_new),
                        child: Column(
                          children: <Widget>[rowHeading1(Ichinsan_title_skill)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        //Skill Detail
        body: Wrap(
            children: skillList.map(
          (data) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  height: 170,
                  margin: const EdgeInsets.only(left: 16, bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: NowUIColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).cardColor,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(IchinsanCommon.returnLanguageData(
                            data.languageName)),
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.languageName,
                        style: TextStyle(fontSize: textSizeSMedium),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.languageLevel,
                        style: TextStyle(fontSize: textSizeSMedium),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  margin: const EdgeInsets.only(left: 16, bottom: 16),
                  height: 170,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        Colors.black12,
                        Colors.black12,
                        Colors.black12,
                        Colors.black12,
                        Colors.black12,
                        Colors.black12,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
