import 'package:flutter/material.dart';
import 'package:project_ta/pages/pages.dart';
import 'package:project_ta/shared/shared.dart';

void main() {
  runApp(const MyApp()); // Hapus kata kunci const di sini
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Tambahkan kata kunci const di sini

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
      ),
      home: const WelcomePage(),
    );
  }
}
