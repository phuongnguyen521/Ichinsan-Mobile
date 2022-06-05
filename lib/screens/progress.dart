import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

class Progress extends StatefulWidget {
  @override
  ProgressState createState() => ProgressState();
}

class ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.menu) // Thay cho Icon App
            ),
        title: Text('Progress'),
      ),
      body: Center(
        child: Text("Progress"),
      ),
    );
  }
}
