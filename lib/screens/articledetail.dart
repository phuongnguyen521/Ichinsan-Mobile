import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key? key}) : super(key: key);
  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.menu) // Thay cho Icon App
            ),
        title: Text('Article Detail'),
      ),
      body: const Center(
        child: Text("Article Detail"),
      ),
    );
  }
}
