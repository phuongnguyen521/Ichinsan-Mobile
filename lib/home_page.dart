import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http_networking/api_service.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostClient _postClient = PostClient();
  final _client = http.Client();

  String? _postTitle;
  String? _postBody;
  String? _requestType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter http Networking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _requestType != null
                ? Center(
                    child: Text(
                      _requestType!,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            const SizedBox(height: 16),
            _postTitle != null ? Text('Title:\n$_postTitle') : Container(),
            const SizedBox(height: 8),
            _postBody != null ? Text('Title:\n$_postBody') : Container(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final post = await _postClient.fetchPost(1);
                      setState(() {
                        _requestType = 'GET';
                        _postTitle = post?.title;
                        _postBody = post?.body;
                      });
                    },
                    child: const Text('GET')),
                ElevatedButton(
                    onPressed: () async {
                      final post = await _postClient.createPost(
                          "Hi Dart", "Hello Dart Worlds");
                      setState(() {
                        _requestType = 'POST';
                        _postTitle = post.title;
                        _postBody = post.body;
                      });
                    },
                    child: const Text('POST')),
                ElevatedButton(
                    onPressed: () async {
                      final post = await _postClient.updatePost(
                          1, "Hello Flutter", "Flutter Hello world");
                      setState(() {
                        _requestType = 'PUT';
                        _postTitle = post.title;
                        _postBody = post.body;
                      });
                    },
                    child: const Text('PUT')),
                ElevatedButton(
                    onPressed: () async {
                      final post = await _postClient.deletePost(2);
                      setState(() {
                        _requestType = 'DELETE';
                        _postTitle = post.title;
                        _postBody = post.body;
                      });
                    },
                    child: const Text('DELETE')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
