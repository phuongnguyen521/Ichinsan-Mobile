import 'package:flutter/material.dart';

import 'package:ichinsan_mobile/constants/Theme.dart';

//widgets
import 'package:ichinsan_mobile/widgets/card-horizontal.dart';

class Process extends StatefulWidget{
  @override
  ProcessState createState() => ProcessState();
}

class ProcessState extends  State<Process> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu) // Thay cho Icon App
        ),
        title: Text('Process'),
      ),
      body: Center(
        child: Text("Process"),
      ),
    );
  }
}