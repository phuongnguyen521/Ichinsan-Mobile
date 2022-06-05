import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FeedbackList extends StatefulWidget {
  const FeedbackList({Key? key}) : super(key: key);
  @override
  State<FeedbackList> createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.menu) // Thay cho Icon App
            ),
        title: Text('Feeback List'),
      ),
      body: Center(
        child: Text("Feeback List"),
      ),
    );
  }
}
