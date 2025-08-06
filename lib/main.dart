import 'package:flutter_api/pages/posts/list_post_screen.dart';
import 'package:flutter_api/pages/quran/list_quran_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: Text('Fetch Data')),
        body: ListQuranScreen(),
      ),
    );
  }
}