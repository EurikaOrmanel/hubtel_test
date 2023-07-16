import 'package:flutter/material.dart';
import 'package:hubtel_test/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(color: Color(0xFFcbcbcb)),
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        colorScheme: ColorScheme.light(
          secondary: Color(0xFFe6eaed),
          onSecondaryContainer: Color(0xFFcdd4db),
        ),
      ),
      home: HomePage(),
    );
  }
}
