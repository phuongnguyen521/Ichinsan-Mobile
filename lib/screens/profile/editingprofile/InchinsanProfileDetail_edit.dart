import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/constants/common.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constants/IchinsanColors.dart';
import '../../../constants/Ichinsan_constant.dart';
import '../../../constants/Ichinsan_string.dart';
import '../../../constants/size_config.dart';
import '../../../model/profile.dart';
import '../../../model/skill.dart';
import '../../../widgets/appwidget.dart';
import '../../../widgets/profile_widget/button_widget.dart';
import '../../../widgets/profile_widget/profile_widget.dart';
import '../Ichinsanprofiledetail.dart';

class EditProfileDetail extends StatefulWidget {
  final Profile userProfile;
  GlobalKey<FormState> form;
  final ValueChanged<Profile> onChanged;
  EditProfileDetail(
      {required this.userProfile, required this.form, required this.onChanged});

  @override
  State<EditProfileDetail> createState() => _EditProfileDetailState();
}

class _EditProfileDetailState extends State<EditProfileDetail> {
  String? selectedValue = null;
  late List<Skill> skillList;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  var _editedProfile = Profile.withDetails(
      '', '', '', '', '', '', DateTime.now(), '', '', [], '');

  var _initValues = {
    'id': '',
    'avatarImage': '',
    'role': '',
    'level': '',
    'fullName': '',
    'email': '',
    'dob': DateTime.now(),
    'gender': '',
    'phonenumber': '',
    'skillList': [],
    'aboutMe': ''
  };

  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final profile = widget.userProfile;
      if (profile != null) {
        _editedProfile = profile;
        _initValues = {
          'id': _editedProfile.id,
          'avatarImage': _editedProfile.avatarImage,
          'role': _editedProfile.role,
          'level': _editedProfile.level,
          'fullName': _editedProfile.fullName,
          'email': _editedProfile.email,
          'dob': _editedProfile.dob,
          'gender': _editedProfile.gender,
          'phonenumber': _editedProfile.phonenumber,
          'skillList': _editedProfile.skillList,
          'aboutMe': _editedProfile.aboutMe,
        };
        selectedValue = profile.gender;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final isValid = widget.form.currentState!.validate();
    if (!isValid) {
      return;
    }

    widget.form.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    if (_editedProfile.id != null) {
      // await Provider.of<Products>(context, listen: false)
      //     .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      // try {
      //   await Provider.of<Products>(context, listen: false)
      //       .addProduct(_editedProduct);
      // } catch (error) {
      //   await showDialog(
      //     context: context,
      //     builder: (ctx) => AlertDialog(
      //           title: Text('An error occurred!'),
      //           content: Text('Something went wrong.'),
      //           actions: <Widget>[
      //             FlatButton(
      //               child: Text('Okay'),
      //               onPressed: () {
      //                 Navigator.of(ctx).pop();
      //               },
      //             )
      //           ],
      //         ),
      //   );
      // }
    }

    setState(() {
      _isLoading = false;
    });

    IchinsanCommon.itemNavigator(
        (context) => ProfileDetailScreen(userProfile: _editedProfile), context);
  }

  Row rowHeading1(var label) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: text(label, fontFamily: fontMedium)),
      ],
    );
  }

  Widget rowHeadingSkillText(var label, var subLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: text(label, textColor: appTextColorSecondary),
          ),
          Expanded(
              flex: 3, child: text(subLabel, textColor: appTextColorSecondary)),
          IconButton(
            icon: const Icon(Icons.clear_rounded, color: appTextColorPrimary),
            onPressed: () {
              Skill _skill = Skill.withDetails(label, subLabel);
              skillList.remove(_skill);
              widget.userProfile.skillList = skillList;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget rowHeading(var label, var subLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: text(label, textColor: appTextColorSecondary),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                isDense: true,
                hintText: subLabel,
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    skillList = widget.userProfile.skillList;

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: NowUIColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: appTextColorPrimary),
          onPressed: () {
            finish(context);
          },
        ),
        title: const Align(
          child: Text(Ichisan_title_edit_profile),
          alignment: Alignment.centerRight,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back, color: appTextColorPrimary),
            onPressed: () {
              finish(context);
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Form(
                  key: widget.form,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
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
                                      //Personal
                                      rowHeading1(Ichinsan_title_personal),
                                      SizedBox(height: spacing_standard),
                                      //Gender
                                      DropdownButtonFormField(
                                        items: dropdownItems,
                                        value: selectedValue,
                                        validator: (value) => value == null
                                            ? "Select a gender"
                                            : null,
                                        onChanged: (String? newValue) {
                                          _editedProfile = Profile.withDetails(
                                              _editedProfile.id,
                                              _editedProfile.avatarImage,
                                              _editedProfile.role,
                                              _editedProfile.level,
                                              _editedProfile.fullName,
                                              _editedProfile.email,
                                              _editedProfile.dob,
                                              newValue!,
                                              _editedProfile.phonenumber,
                                              _editedProfile.skillList,
                                              _editedProfile.aboutMe);
                                          setState(() {
                                            selectedValue = newValue;
                                          });
                                        },
                                      ),
                                      const SizedBox(height: 8),
                                      //Date of Birth
                                      DateFormField(
                                          currentDateValue: _initValues['dob'],
                                          dateLabel: Ichinsan_label_dob,
                                          dateValidator: widget
                                              .userProfile.birthDateIsValid,
                                          onDateChanged: (dob) => widget
                                              .onChanged(widget.userProfile
                                                  .copyWith(dob: dob))),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 10, 16, 0),
                                        child: view(),
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                )),
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
                                    rowHeading(Ichinsan_label_phone_number,
                                        widget.userProfile.phonenumber),
                                    view().paddingOnly(
                                        left: 16, top: 8, right: 16, bottom: 8),
                                    8.height,
                                  ],
                                ),
                              ),
                            ),
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
                                    Row(
                                      children: [
                                        rowHeading1(Ichinsan_title_skill),
                                        IconButton(
                                          icon: const Icon(
                                              Icons.add_circle_outline,
                                              color: appTextColorPrimary),
                                          onPressed: () {
                                            Skill _skill = Skill.withDetails(
                                                'label', 'subLabel');
                                            skillList.remove(_skill);
                                            widget.userProfile.skillList =
                                                skillList;
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                    8.height,
                                    GridView.builder(
                                      itemCount: skillList.length,
                                      itemBuilder: (context, index) =>
                                          rowHeadingSkillText(
                                              skillList[index].languageName,
                                              skillList[index].languageLevel),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 20,
                                              childAspectRatio: 1.65),
                                    ),
                                    view().paddingOnly(
                                        left: 16, top: 8, right: 16, bottom: 8),
                                    8.height,
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: spacing_standard_new,
                                  right: spacing_standard_new),
                              // child: QIBusAppButton(
                              //   textContent: QIBus_text_save,
                              //   onPressed: () {
                              //     finish(context);
                              //   },
                              // ),
                            ),
                            16.height,
                          ],
                        ),
                      ))
                    ],
                  )),
            ),
    );

    // return Scaffold(
    //     //backgroundColor: qIBus_app_background,
    //     body: Column(
    //   children: <Widget>[
    //     Expanded(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: <Widget>[
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: <Widget>[
    //                 IconButton(
    //                   icon: const Icon(Icons.arrow_back,
    //                       color: appTextColorPrimary),
    //                   onPressed: () {
    //                     finish(context);
    //                   },
    //                 ),
    //                 ProfileWidget(
    //                   avatarImage: widget.userProfile.avatarImage,
    //                   onClicked: () async {},
    //                 ),
    //                 GestureDetector(
    //                   child: ButtonWidget(
    //                       onClicked: () {
    //                         EditProfileDetail(userProfile: widget.userProfile)
    //                             .launch(context);
    //                       },
    //                       text: Inchisan_label_edit),
    //                 ),
    //               ],
    //             ),
    //             Container(
    //                 margin: EdgeInsets.only(
    //                     left: spacing_standard_new,
    //                     right: spacing_standard_new,
    //                     top: spacing_standard_new),
    //                 decoration: boxDecoration(
    //                   showShadow: true,
    //                   bgColor: context.cardColor,
    //                   radius: spacing_middle,
    //                 ),
    //                 child: Padding(
    //                   padding: EdgeInsets.fromLTRB(
    //                       spacing_standard,
    //                       spacing_standard,
    //                       spacing_standard,
    //                       spacing_standard_new),
    //                   child: Column(
    //                     children: <Widget>[
    //                       rowHeading1(Ichinsan_title_personal),
    //                       SizedBox(height: spacing_standard),
    //                       Padding(
    //                         padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    //                         child: Row(
    //                           children: <Widget>[
    //                             Expanded(
    //                               flex: 2,
    //                               child: text(Ichinsan_label_gender,
    //                                   textColor: IchinsanColors_textChild),
    //                             ),
    //                             Expanded(
    //                               flex: 3,
    //                               child: DropdownButtonHideUnderline(
    //                                 child: DropdownButton<String>(
    //                                   value: _selectedLocation,
    //                                   items: <String>['Female', 'Male']
    //                                       .map((String value) {
    //                                     return new DropdownMenuItem<String>(
    //                                       value: value,
    //                                       child: text(value,
    //                                           fontSize: textSizeMedium,
    //                                           textColor:
    //                                               IchinsanColors_textChild),
    //                                     );
    //                                   }).toList(),
    //                                   onChanged: (newValue) {
    //                                     setState(() {
    //                                       _selectedLocation = newValue;
    //                                     });
    //                                   },
    //                                 ),
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                       SizedBox(height: 8),
    //                       Padding(
    //                         padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    //                         child: Column(
    //                           children: [
    //                             Expanded(
    //                               flex: 2,
    //                               child: text(Ichinsan_label_dob,
    //                                   textColor: appTextColorSecondary),
    //                             ),
    //                             Row(
    //                               children: <Widget>[
    //                                 Expanded(
    //                                     flex: 3,
    //                                     child: text(
    //                                         '${dob.day}/${dob.month}/${dob.year}',
    //                                         textColor: appTextColorSecondary)),
    //                                 IconButton(
    //                                   icon: const Icon(Icons.edit_calendar,
    //                                       color: appTextColorPrimary),
    //                                   onPressed: () async {
    //                                     DateTime? newDate =
    //                                         await showDatePicker(
    //                                             context: context,
    //                                             initialDate: dob,
    //                                             firstDate: DateTime(1900),
    //                                             lastDate: DateTime(2100));

    //                                     if (newDate == null) return;

    //                                     setState(() => dob = newDate);
    //                                   },
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
    //                         child: view(),
    //                       ),
    //                       SizedBox(height: 8),
    //                     ],
    //                   ),
    //                 )),
    //             Container(
    //               margin: const EdgeInsets.only(
    //                   left: spacing_standard_new,
    //                   right: spacing_standard_new,
    //                   top: spacing_standard_new,
    //                   bottom: spacing_standard_new),
    //               decoration: boxDecoration(
    //                 showShadow: true,
    //                 bgColor: context.cardColor,
    //                 radius: spacing_middle,
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.fromLTRB(
    //                     spacing_standard,
    //                     spacing_standard,
    //                     spacing_standard,
    //                     spacing_standard_new),
    //                 child: Column(
    //                   children: <Widget>[
    //                     rowHeading1(Ichinsan_title_contacts),
    //                     8.height,
    //                     rowHeading(Ichinsan_label_phone_number,
    //                         widget.userProfile.phonenumber),
    //                     view().paddingOnly(
    //                         left: 16, top: 8, right: 16, bottom: 8),
    //                     8.height,
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.only(
    //                   left: spacing_standard_new,
    //                   right: spacing_standard_new,
    //                   top: spacing_standard_new,
    //                   bottom: spacing_standard_new),
    //               decoration: boxDecoration(
    //                 showShadow: true,
    //                 bgColor: context.cardColor,
    //                 radius: spacing_middle,
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.fromLTRB(
    //                     spacing_standard,
    //                     spacing_standard,
    //                     spacing_standard,
    //                     spacing_standard_new),
    //                 child: Column(
    //                   children: <Widget>[
    //                     Row(
    //                       children: [
    //                         rowHeading1(Ichinsan_title_skill),
    //                         IconButton(
    //                           icon: const Icon(Icons.add_circle_outline,
    //                               color: appTextColorPrimary),
    //                           onPressed: () {
    //                             Skill _skill =
    //                                 Skill.withDetails(label, subLabel);
    //                             skillList.remove(_skill);
    //                             widget.userProfile.skillList = skillList;
    //                             setState(() {});
    //                           },
    //                         ),
    //                       ],
    //                     ),
    //                     8.height,
    //                     GridView.builder(
    //                       itemCount: skillList.length,
    //                       itemBuilder: (context, index) => rowHeadingSkillText(
    //                           skillList[index].languageName,
    //                           skillList[index].languageLevel),
    //                       gridDelegate:
    //                           const SliverGridDelegateWithFixedCrossAxisCount(
    //                               crossAxisCount: 2,
    //                               mainAxisSpacing: 20,
    //                               childAspectRatio: 1.65),
    //                     ),
    //                     view().paddingOnly(
    //                         left: 16, top: 8, right: 16, bottom: 8),
    //                     8.height,
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: EdgeInsets.only(
    //                   left: spacing_standard_new, right: spacing_standard_new),
    //               child: QIBusAppButton(
    //                 textContent: QIBus_text_save,
    //                 onPressed: () {
    //                   finish(context);
    //                 },
    //               ),
    //             ),
    //             16.height,
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // ));
  }
}

class DateFormField extends StatelessWidget {
  //Date of Birth
  late ValueChanged<DateTime> onDateChanged;
  late DateTime? currentDateValue;
  late FormFieldValidator<DateTime>? dateValidator;
  late String dateLabel;

  DateFormField(
      {Key? key, onDateChanged, currentDateValue, dateValidator, dateLabel})
      : super(key: key);

  String get _label {
    if (currentDateValue == null) return dateLabel;
    return DateFormat.yMMMMd().format(currentDateValue!);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: currentDateValue,
        validator: dateValidator,
        builder: (formState) {
          late InputBorder shape;

          if (formState.hasError) {
            shape = Theme.of(context).inputDecorationTheme.errorBorder!;
          } else {
            shape = Theme.of(context).inputDecorationTheme.enabledBorder!;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _buildDateSelectListTile(shape, context, formState),
                  if (currentDateValue != null) _buildFloatingLabel(context),
                ],
              ),
              if (formState.hasError) _buildErrorText(formState, context),
            ],
          );
        });
  }

  Widget _buildDateSelectListTile(InputBorder shape, BuildContext context,
      FormFieldState<DateTime> formState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacing_control),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: spacing_standard_new),
        shape: shape,
        trailing: Icon(Icons.date_range),
        title: Text(_label),
        onTap: () async {
          final date = await showDatePicker(
              context: context,
              initialDate: currentDateValue!,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));
          if (date != null) {
            onDateChanged(date);
            formState.didChange(date);
          }
        },
      ),
    );
  }

  Widget _buildFloatingLabel(BuildContext context) {
    return Positioned(
      left: 12.0,
      top: -2.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Text(
          dateLabel,
          style: Theme.of(context).inputDecorationTheme.helperStyle,
        ),
      ),
    );
  }

  Widget _buildErrorText(
      FormFieldState<DateTime> formState, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: spacing_standard, horizontal: spacing_standard_new),
      child: Text(
        formState.errorText!,
        style: Theme.of(context).inputDecorationTheme.errorStyle,
      ),
    );
  }
}
