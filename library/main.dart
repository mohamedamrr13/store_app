import 'package:flutter/material.dart';
import 'helper/helper.dart';
import 'screens/homepage.dart';
import 'screens/updatepage.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homePageId: (context) => const HomePage(),
        UpdatePage.id: (context) => UpdatePage()
      },
      initialRoute: homePageId,
    );
  }
}
