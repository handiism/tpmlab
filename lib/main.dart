import 'package:flutter/material.dart';
import 'package:tpmlab/pages/page_list_users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Network',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageListUsers(),
    );
  }
}
