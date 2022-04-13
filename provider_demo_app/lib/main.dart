import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo_app/providers/comments_provider.dart';
import 'package:provider_demo_app/providers/posts_provider.dart';
import 'package:provider_demo_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
        ChangeNotifierProvider(create: (context) => CommentsProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider App Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          colorScheme: ColorScheme.fromSwatch(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
