import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ichinsan_mobile/constants/Theme.dart';
import 'package:ichinsan_mobile/screens/profile_widget/profile_widget.dart';
import 'package:ichinsan_mobile/screens/profile_widget/button_widget.dart';
import './signin.dart';
import '../model/profile.dart';
import '../model/profile_data.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User user;
  bool isNull = true;
  late Profile userProfile;
  String? photoURL;
  bool isLoading = false;

  @override
  void initState() {
    try {
      user = FirebaseAuth.instance.currentUser!;
      isNull = false;
    } catch (e) {
      isNull = true;
      print(e);
    } finally {
      userProfile = setData();
    }
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.menu) // Thay cho Icon App
              ),
          title: Text('Profile'),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              avatarImage: userProfile.avatarImage,
              onClicked: () async {},
            ),
            const SizedBox(height: 20),
            buildName(userProfile),
            const SizedBox(height: 20),
            buildAbout(userProfile),
            const SizedBox(height: 20),
            Center(
              child: ButtonWidget(
                  onClicked: isAnonymous() ? _signIn : _signOut,
                  text: textOfButton()),
            ),
          ],
        ));
  }

  Widget buildName(Profile userProfile) => Column(
        children: [
          Row(
            children: [
              Text(
                'Fullname',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                userProfile.fullName,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Role',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                userProfile.role,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Level',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                userProfile.level,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                userProfile.email,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Phonenumber',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                userProfile.phonenumber,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                userProfile.gender,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Birthdate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                userProfile.dob.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Text(
            'Skill',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      );

  Widget buildAbout(Profile userProfile) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 15),
          Text(
            userProfile.aboutMe,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      );

  Future<String?> getPhotoURLFromUser() async {
    String? photoURL;

    // Update the UI - wait for the user to enter the SMS code
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('New image Url:'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
            OutlinedButton(
              onPressed: () {
                photoURL = null;
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          content: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                photoURL = value;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
          ),
        );
      },
    );

    return photoURL;
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    setState(() {});
  }

  Future _signIn() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  String textOfButton() {
    return isAnonymous() ? 'Sign In' : 'Sign Out';
  }

  bool isAnonymous() => isNull;

  dynamic setData() {
    var result = isAnonymous();
    if (!result) {
      Profile_Data.avatarImage = user.photoURL ?? placeholderImage;
      Profile_Data.email = user.email;
      return Profile_Data.myProfile;
    } else {
      Profile_Data.avatarImage = placeholderImage;
      Profile_Data.email = 'unknown';
      return Profile_Data.myDefaultProfile;
    }
  }
}
