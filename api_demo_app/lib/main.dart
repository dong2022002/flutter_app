import 'package:api_demo_app/network/network_request.dart';
import 'package:flutter/material.dart';

import 'models/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ListViewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Post> postData = <Post>[];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchPosts().then((value) {
      setState(() {
        postData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HTTP request',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: postData.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${postData[index].id} .${postData[index].title}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text('${postData[index].body}',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14))
                          ],
                        ),
                      ),
                    );
                  })))
        ],
      ),
    );
  }
}
