import 'package:flutter/material.dart';
import 'package:provider_demo_app/screens/home_second.dart';
import 'package:provider_demo_app/wigets/post_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'All Posts (demo)',
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Expanded(
            child: PostList(),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeSecond()));
            },
            child: const Text(
              'Comment (click here)',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
