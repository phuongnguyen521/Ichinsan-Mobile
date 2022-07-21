import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ichinsan_mobile/main.dart';
import 'package:ichinsan_mobile/model/account/new_account.dart';
import 'package:ichinsan_mobile/utils/account_client.dart';
import 'package:ichinsan_mobile/widgets/profile_widget/button_widget.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/IchinsanColors.dart';
import '../constants/Ichinsan_string.dart';
import '../constants/common.dart';
import '../constants/size_config.dart';
import '../model/profile/profile.dart';
import '../model/skill.dart';
import '../widgets/profile_widget/profile_edit_widget.dart';
import 'profile/Ichinsanprofiledetail.dart';
import 'signin.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  GlobalKey<FormState> form;
  SignUp({Key? key, required this.form}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var fullNameController = TextEditingController();
  var contactNumberController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode contactNumberFocusNode = FocusNode();
  List<DropdownMenuItem<String>> get dropdownGenderItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: Ichinsan_profile_gender_male,
          child: Text(Ichinsan_profile_gender_male)),
      const DropdownMenuItem(
          value: Ichinsan_profile_gender_female,
          child: Text(Ichinsan_profile_gender_female)),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownRoleItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: Ichinsan_profile_role_translator,
          child: Text(Ichinsan_profile_role_translator)),
      const DropdownMenuItem(
          value: Ichinsan_profile_role_auditor,
          child: Text(Ichinsan_profile_role_auditor)),
    ];
    return menuItems;
  }

  var _newAccount = NewAccount(
      dob: DateTime.now(),
      email: '',
      fullName: '',
      gender: 0,
      phoneNumber: '',
      role: '',
      website: '');

  var _isInit = false;
  var _isLoading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    contactNumberController.dispose();
    fullNameFocusNode.dispose();
    contactNumberFocusNode.dispose();
    super.dispose();
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
    if (_newAccount != null) {
      setState(() {
        _isLoading = true;
      });
      var isSuccessful = await Ichinsanregister(_newAccount);
      if (isSuccessful) {
        var account = await Ichinsanlogin(_newAccount.email!);
        if (account != null) {
          // ignore: use_build_context_synchronously
          return IchinsanCommon.itemNavigatorPushAndRemove(
              (context) => IchinsanPage(
                    index: 2,
                    title: 'Ichinsan-MobileApp',
                  ),
              context);
        }
      }
    }
    setState(() {
      _isLoading = false;
    });
    return null;
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
    late User user = FirebaseAuth.instance.currentUser!;
    var selectedGender = Ichinsan_profile_gender_female;
    var selectedRole = Ichinsan_profile_role_translator;
    var fullnameValue = "";
    var dobValue = DateTime.now();
    var phonenumberValue = "";
    _newAccount.email = user.email;
    _newAccount.gender = 0;
    _newAccount.role = Ichinsan_profile_role_translator;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: NowUIColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: appTextColorPrimary),
          onPressed: () {
            _signOut();
          },
        ),
        title: const Align(
          alignment: Alignment.centerRight,
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
                                      hint: Ichinsan_profile_hint_full_name,
                                    ),
                                    controller: TextEditingController(
                                        text: fullnameValue),
                                    textFieldType: TextFieldType.NAME,
                                    keyboardType: TextInputType.name,
                                    focus: fullNameFocusNode,
                                    onChanged: (String? newValue) {
                                      _newAccount = NewAccount(
                                          dob: _newAccount.dob,
                                          email: _newAccount.email,
                                          fullName: newValue,
                                          gender: _newAccount.gender,
                                          phoneNumber: _newAccount.phoneNumber,
                                          role: _newAccount.role,
                                          website: _newAccount.website);
                                    },
                                  ),
                                  //Gender
                                  const SizedBox(height: spacing_standard_new),
                                  rowField(Ichinsan_label_gender),
                                  const SizedBox(height: spacing_standard),
                                  DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: ichinsanInputDecoration(
                                        hint: Ichinsan_profile_hint_gender),
                                    items: dropdownGenderItems,
                                    validator: (value) => value == null
                                        ? Ichinsan_profile_hint_gender
                                        : null,
                                    value: selectedGender,
                                    onChanged: (newValue) {
                                      var genderBit = newValue
                                              .toString()
                                              .contains(
                                                  Ichinsan_profile_gender_female)
                                          ? 0
                                          : 1;
                                      _newAccount = NewAccount(
                                          dob: _newAccount.dob,
                                          email: _newAccount.email,
                                          fullName: _newAccount.fullName,
                                          gender: genderBit,
                                          phoneNumber: _newAccount.phoneNumber,
                                          role: _newAccount.role,
                                          website: _newAccount.website);
                                      setState(() {
                                        selectedGender = newValue.toString();
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
                                        .format(dobValue)
                                        .toString(),
                                    onChanged: (val) {
                                      _newAccount = NewAccount(
                                          dob: DateTime.parse(val),
                                          email: _newAccount.email,
                                          fullName: _newAccount.fullName,
                                          gender: _newAccount.gender,
                                          phoneNumber: _newAccount.phoneNumber,
                                          role: _newAccount.role,
                                          website: _newAccount.website);
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
                                      hint: Ichinsan_profile_hint_phone_number,
                                    ),
                                    initialValue: phonenumberValue,
                                    textFieldType: TextFieldType.PHONE,
                                    keyboardType: TextInputType.phone,
                                    focus: contactNumberFocusNode,
                                    onChanged: (String? newValue) {
                                      _newAccount = NewAccount(
                                          dob: _newAccount.dob,
                                          email: _newAccount.email,
                                          fullName: _newAccount.fullName,
                                          gender: _newAccount.gender,
                                          phoneNumber: newValue,
                                          role: _newAccount.role,
                                          website: _newAccount.website);
                                    },
                                  ),
                                  //Email
                                  AppTextField(
                                      enabled: false,
                                      decoration: ichinsanInputDecoration(
                                        hint: Ichinsan_profile_hint_email,
                                      ),
                                      initialValue: _newAccount.email,
                                      textFieldType: TextFieldType.EMAIL,
                                      keyboardType: TextInputType.emailAddress)
                                ],
                              ),
                            ),
                            //Role
                            Container(
                              padding:
                                  const EdgeInsets.all(spacing_standard_new),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 0.5)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  rowHeading1(Ichinsan_title_role),
                                  const SizedBox(height: spacing_standard_new),
                                  DropdownButtonFormField(
                                    isExpanded: true,
                                    decoration: ichinsanInputDecoration(
                                        hint: Ichinsan_profile_hint_role),
                                    items: dropdownRoleItems,
                                    validator: (value) => value == null
                                        ? Ichinsan_profile_hint_role
                                        : null,
                                    value: selectedRole,
                                    onChanged: (newValue) {
                                      _newAccount = NewAccount(
                                          dob: _newAccount.dob,
                                          email: _newAccount.email,
                                          fullName: _newAccount.fullName,
                                          gender: _newAccount.gender,
                                          phoneNumber: _newAccount.phoneNumber,
                                          role: newValue.toString(),
                                          website: _newAccount.website);
                                      setState(() {
                                        selectedRole = newValue.toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            10.height,
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

  Future _signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    // ignore: use_build_context_synchronously
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }
}
