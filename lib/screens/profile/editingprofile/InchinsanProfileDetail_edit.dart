import 'package:flutter/material.dart';
import 'package:ichinsan_mobile/constants/common.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constants/IchinsanColors.dart';
import '../../../constants/Ichinsan_constant.dart';
import '../../../constants/Ichinsan_string.dart';
import '../../../constants/size_config.dart';
import '../../../main.dart';
import '../../../model/profile.dart';
import '../../../model/skill.dart';
import '../../../widgets/appwidget.dart';
import '../../../widgets/profile_widget/button_widget.dart';
import '../../../widgets/profile_widget/profile_edit_widget.dart';
import '../Ichinsanprofiledetail.dart';
import '../profilescreen.dart';

class EditProfileDetail extends StatefulWidget {
  late Profile userProfile;
  GlobalKey<FormState> form;
  final ValueChanged<Profile> onChanged;
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
  late List<Skill> skillList;
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
    skillList = widget.userProfile.skillList;
    var selectedGender = widget.userProfile.gender;
    var fullnameValue = _editedProfile.fullName;
    var dobValue = _editedProfile.dob;
    var phonenumberValue = _editedProfile.phonenumber;
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
          alignment: Alignment.centerRight,
          child: Text(Ichisan_title_edit_profile),
        ),
        actions: <Widget>[
          GestureDetector(
            child: ButtonWidget(
                onClicked: () async {
                  await _saveForm();
                },
                text: Inchisan_label_save),
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
                                children: [
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
                                      _editedProfile = Profile.withDetails(
                                          _editedProfile.id,
                                          _editedProfile.avatarImage,
                                          _editedProfile.role,
                                          _editedProfile.level,
                                          newValue!,
                                          _editedProfile.email,
                                          _editedProfile.dob,
                                          _editedProfile.gender,
                                          _editedProfile.phonenumber,
                                          _editedProfile.skillList,
                                          _editedProfile.aboutMe);
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
                                        selectedGender = newValue;
                                      });
                                    },
                                  ),
                                  //Date of birth
                                  const SizedBox(height: spacing_standard_new),
                                  rowField(Ichinsan_label_dob),
                                  const SizedBox(height: spacing_standard),
                                  // DateFormField(
                                  //     currentDateValue: dobValue,
                                  //     dateLabel: Ichinsan_label_dob,
                                  //     dateValidator:
                                  //         widget.userProfile.birthDateIsValid,
                                  //     onDateChanged: (dob) => widget.onChanged(
                                  //         _editedProfile.copyWith(dob: dob))),
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
                                      _editedProfile = Profile.withDetails(
                                          _editedProfile.id,
                                          _editedProfile.avatarImage,
                                          _editedProfile.role,
                                          _editedProfile.level,
                                          _editedProfile.fullName,
                                          _editedProfile.email,
                                          _editedProfile.dob,
                                          _editedProfile.gender,
                                          newValue!,
                                          _editedProfile.skillList,
                                          _editedProfile.aboutMe);
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
                                        _editedProfile = Profile.withDetails(
                                            _editedProfile.id,
                                            _editedProfile.avatarImage,
                                            _editedProfile.role,
                                            _editedProfile.level,
                                            _editedProfile.fullName,
                                            _editedProfile.email,
                                            _editedProfile.dob,
                                            _editedProfile.gender,
                                            _editedProfile.phonenumber,
                                            _editedProfile.skillList,
                                            aboutMe);
                                      }),
                                ],
                              ),
                            ),
                            16.height,
                          ],
                        ),
                      ))
                    ],
                  )),
            ),
    );
  }
}

class DateFormField extends StatelessWidget {
  //Date of Birth
  ValueChanged<DateTime>? onDateChanged;
  DateTime? currentDateValue;
  FormFieldValidator<DateTime>? dateValidator;
  String? dateLabel;

  DateFormField(
      {Key? key, onDateChanged, currentDateValue, dateValidator, dateLabel})
      : super(key: key);

  String get _label {
    if (currentDateValue == null) return dateLabel!;
    return DateFormat.yMMMMd().format(currentDateValue!);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        initialValue: currentDateValue,
        validator: dateValidator,
        builder: (formState) {
          late InputBorder? shape;

          if (formState.hasError) {
            shape = Theme.of(context).inputDecorationTheme.errorBorder;
          } else {
            shape = Theme.of(context).inputDecorationTheme.enabledBorder;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  _buildDateSelectListTile(shape!, context, formState),
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
            onDateChanged!(date);
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
          dateLabel!,
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
