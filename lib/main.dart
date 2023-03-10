import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_in_flutter_blog/pages/all_todos_page.dart';
import 'package:testing_in_flutter_blog/pages/login_page.dart';

void main() {
  runApp(ProviderScope(child: TestingInFlutterBlog()));
}

class TestingInFlutterBlog extends StatelessWidget {
  const TestingInFlutterBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllTodoPage(),
    );
  }
}
