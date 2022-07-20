import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/common.dart';
import 'package:ichinsan_mobile/model/profile/Ichinsanprofile.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constants/IchinsanColors.dart';
import '../../../constants/Ichinsan_constant.dart';
import '../../../constants/Ichinsan_string.dart';
import '../../../constants/size_config.dart';
import '../../../main.dart';
import '../../../model/profile/profile.dart';
import '../../../model/profile/profile.dart';
import '../../../model/skill.dart';
import '../../../widgets/appwidget.dart';
import '../../../widgets/profile_widget/button_widget.dart';
import '../../../widgets/profile_widget/profile_edit_widget.dart';
import '../Ichinsanprofiledetail.dart';
import '../profilescreen.dart';

class EditProfileDetail extends StatefulWidget {
  late IchinsanProfile userProfile;
  GlobalKey<FormState> form;
  final ValueChanged<dynamic> onChanged;
  EditProfileDetail(
      {Key? key,
      required this.userProfile,
      required this.form,
      required this.onChanged})
      : super(key: key);

  @override
  State<EditProfileDetail> createState() => _EditProfileDetailState();
}

class _EditProfileDetailState extends State<EditProfileDetail> {
  late List<dynamic> skillList = widget.userProfile.languageSkill!;
  var fullNameController = TextEditingController();
  var contactNumberController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode contactNumberFocusNode = FocusNode();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  var _editedProfile = IchinsanProfile(
      id: '',
      avatarImage: '',
      balance: 0,
      birthday: DateTime.now(),
      email: '',
      fullName: '',
      gender: '',
      languageSkill: [],
      phoneNumber: '',
      role: '',
      technique: '',
      website: '',
      aboutMe: '');

  var _initValues = {
    'id': '',
    'avatarImage': '',
    'balance': 0,
    'birthday': DateTime.now(),
    'email': '',
    'fullName': '',
    'gender': '',
    'languageSkill': [],
    'phoneNumber': '',
    'role': '',
    'technique': '',
    'website': '',
    'aboutMe': ''
  };

  var _isInit = true;
  var _isLoading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    contactNumberController.dispose();
    fullNameFocusNode.dispose();
    contactNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final profile = widget.userProfile;
      if (profile != null) {
        _editedProfile = profile;
        _initValues = {
          'id': _editedProfile.id.toString(),
          'avatarImage': _editedProfile.avatarImage.toString(),
          'balance': _editedProfile.balance.toString(),
          'birthday': _editedProfile.birthday.toString(),
          'email': _editedProfile.email.toString(),
          'fullName': _editedProfile.fullName.toString(),
          'gender': _editedProfile.gender.toString(),
          'languageSkill': skillList,
          'phoneNumber': _editedProfile.phoneNumber.toString(),
          'role': _editedProfile.role.toString(),
          'technique': _editedProfile.technique.toString(),
          'website': _editedProfile.website.toString(),
          'aboutMe': _editedProfile.aboutMe.toString()
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future _saveForm() async {
    final isValid = widget.form.currentState!.validate();
    if (!isValid) {
      return;
    }

    widget.form.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    if (_editedProfile.id != null) {
      widget.userProfile = _editedProfile;
    } else {}

    setState(() {
      _isLoading = false;
    });

    return IchinsanCommon.itemNavigator(
        (context) => ProfileDetailScreen(userProfile: widget.userProfile),
        context);
  }

  Row rowHeading1(var label) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(label, style: boldTextStyle(size: 16))),
      ],
    );
  }

  Row rowField(var label) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(label, style: boldTextStyle(size: 14))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var selectedGender = widget.userProfile.gender;
    var fullnameValue = _editedProfile.fullName;
    var dobValue = _editedProfile.birthday;
    var phonenumberValue = _editedProfile.phoneNumber;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: NowUIColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: appTextColorPrimary),
          onPressed: () {
            IchinsanCommon.itemNavigator(
                (context) =>
                    ProfileDetailScreen(userProfile: widget.userProfile),
                context);
          },
        ),
        title: const Align(
          alignment: Alignment.topCenter,
          child: Text(Ichisan_title_edit_profile),
        ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Personal
                            Container(
                              padding: EdgeInsets.all(spacing_standard_new),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 0.5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  rowHeading1(Ichinsan_title_personal),
                                  const SizedBox(height: spacing_standard_new),
                                  rowField(Ichinsan_label_fullname),
                                  const SizedBox(height: spacing_standard),
                                  //Full name
                                  AppTextField(
                                    decoration: ichinsanInputDecoration(
                                      hint: 'Enter your full name here',
                                    ),
                                    initialValue: fullnameValue,
                                    textFieldType: TextFieldType.NAME,
                                    keyboardType: TextInputType.name,
                                    focus: fullNameFocusNode,
                                    onChanged: (String? newValue) {
                                      _editedProfile = IchinsanProfile(
                                        id: _editedProfile.id,
                                        avatarImage: _editedProfile.avatarImage,
                                        balance: _editedProfile.balance,
                                        birthday: _editedProfile.birthday,
                                        email: _editedProfile.email,
                                        fullName: newValue,
                                        gender: _editedProfile.gender,
                                        languageSkill:
                                            _editedProfile.languageSkill,
                                        phoneNumber: _editedProfile.phoneNumber,
                                        role: _editedProfile.role,
                                        technique: _editedProfile.technique,
                                        website: _editedProfile.website,
                                        aboutMe: _editedProfile.aboutMe,
                                      );
                                    },
                                  ),
                                  //Gender
                                  const SizedBox(height: spacing_standard_new),
                                  rowField(Ichinsan_label_gender),
                                  const SizedBox(height: spacing_standard),
                                  DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: ichinsanInputDecoration(
                                        hint: "Select your gender"),
                                    items: dropdownItems,
                                    validator: (value) => value == null
                                        ? "Select a gender"
                                        : null,
                                    value: selectedGender,
                                    onChanged: (String? newValue) {
                                      _editedProfile = IchinsanProfile(
                                        id: _editedProfile.id,
                                        avatarImage: _editedProfile.avatarImage,
                                        balance: _editedProfile.balance,
                                        birthday: _editedProfile.birthday,
                                        email: _editedProfile.email,
                                        fullName: _editedProfile.fullName,
                                        gender: newValue,
                                        languageSkill:
                                            _editedProfile.languageSkill,
                                        phoneNumber: _editedProfile.phoneNumber,
                                        role: _editedProfile.role,
                                        technique: _editedProfile.technique,
                                        website: _editedProfile.website,
                                        aboutMe: _editedProfile.aboutMe,
                                      );
                                      setState(() {
                                        selectedGender = newValue;
                                      });
                                    },
                                  ),
                                  //Date of birth
                                  const SizedBox(height: spacing_standard_new),
                                  rowField(Ichinsan_label_dob),
                                  const SizedBox(height: spacing_standard),
                                  DateTimePicker(
                                    type: DateTimePickerType.date,
                                    dateMask: 'd MMM, yyyy',
                                    initialDate: dobValue,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                    dateHintText: DateFormat.yMMMMd()
                                        .format(dobValue!)
                                        .toString(),
                                    onChanged: (val) {
                                      _editedProfile = IchinsanProfile(
                                        id: _editedProfile.id,
                                        avatarImage: _editedProfile.avatarImage,
                                        balance: _editedProfile.balance,
                                        birthday: DateTime.parse(val),
                                        email: _editedProfile.email,
                                        fullName: _editedProfile.fullName,
                                        gender: _editedProfile.gender,
                                        languageSkill:
                                            _editedProfile.languageSkill,
                                        phoneNumber: _editedProfile.phoneNumber,
                                        role: _editedProfile.role,
                                        technique: _editedProfile.technique,
                                        website: _editedProfile.website,
                                        aboutMe: _editedProfile.aboutMe,
                                      );
                                      setState(() {
                                        dobValue = DateTime.parse(val);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //Contacts
                            Container(
                              padding: EdgeInsets.all(spacing_standard_new),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 0.5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  rowHeading1(Ichinsan_title_contacts),
                                  const SizedBox(height: spacing_standard_new),
                                  rowField(Ichinsan_label_phone_number),
                                  const SizedBox(height: spacing_standard),
                                  //Phone number
                                  AppTextField(
                                    decoration: ichinsanInputDecoration(
                                      hint: 'Enter your contact number here',
                                    ),
                                    initialValue: phonenumberValue,
                                    textFieldType: TextFieldType.PHONE,
                                    keyboardType: TextInputType.phone,
                                    focus: contactNumberFocusNode,
                                    onChanged: (String? newValue) {
                                      _editedProfile = IchinsanProfile(
                                        id: _editedProfile.id,
                                        avatarImage: _editedProfile.avatarImage,
                                        balance: _editedProfile.balance,
                                        birthday: _editedProfile.birthday,
                                        email: _editedProfile.email,
                                        fullName: _editedProfile.fullName,
                                        gender: _editedProfile.gender,
                                        languageSkill:
                                            _editedProfile.languageSkill,
                                        phoneNumber: newValue,
                                        role: _editedProfile.role,
                                        technique: _editedProfile.technique,
                                        website: _editedProfile.website,
                                        aboutMe: _editedProfile.aboutMe,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //About me
                            Container(
                              padding: EdgeInsets.all(spacing_standard_new),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 0.5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  rowHeading1(Ichinsan_label_about_me),
                                  const SizedBox(height: spacing_standard_new),
                                  TextFieldWidget(
                                      label: 'About Me',
                                      maxLines: 5,
                                      maxLength: 255,
                                      content:
                                          _initValues['aboutMe'].toString(),
                                      hint: 'Enter your information here',
                                      onChanged: (aboutMe) {
                                        _editedProfile = IchinsanProfile(
                                          id: _editedProfile.id,
                                          avatarImage:
                                              _editedProfile.avatarImage,
                                          balance: _editedProfile.balance,
                                          birthday: _editedProfile.birthday,
                                          email: _editedProfile.email,
                                          fullName: _editedProfile.fullName,
                                          gender: _editedProfile.gender,
                                          languageSkill:
                                              _editedProfile.languageSkill,
                                          phoneNumber:
                                              _editedProfile.phoneNumber,
                                          role: _editedProfile.role,
                                          technique: _editedProfile.technique,
                                          website: _editedProfile.website,
                                          aboutMe: aboutMe,
                                        );
                                      }),
                                ],
                              ),
                            ),
                            16.height,
                            Center(
                              child: GestureDetector(
                                child: ButtonWidget(
                                    onClicked: () async {
                                      await _saveForm();
                                    },
                                    text: Inchisan_label_save),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  )),
            ),
    );
  }
}
