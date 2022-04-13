import 'package:flutter/material.dart';
import 'package:provider_demo_app/wigets/comment_list.dart';

class HomeSecond extends StatelessWidget {
  const HomeSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Comment (demo)',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          const SizedBox(height: 20),
          const Expanded(child: CommentList()),
          InkWell(
            onTap: (() => Navigator.pop(context)),
            child: const Text(
              'Go back',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]));
  }
}
