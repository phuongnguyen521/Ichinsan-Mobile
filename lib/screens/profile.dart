import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

class Profile extends StatefulWidget{
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends  State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu) // Thay cho Icon App
        ),
        title: Text('Profile'),
      ),
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}