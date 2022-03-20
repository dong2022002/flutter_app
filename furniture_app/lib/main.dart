import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/values/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.dmSansTextTheme().apply(
          displayColor: AppColor.kTextColor,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      home: const HomeScreen(),
    );
  }
}
