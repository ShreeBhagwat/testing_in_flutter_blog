import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/todo.dart';

class TodoService {
  final http.Client client;

  TodoService(this.client);

  Future<List<Todo>> getTodos() async {
    final todoUri = Uri.parse('https://dummyjson.com/todos');
    final response = await client.get(todoUri);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as Map<String, dynamic>;

      final todos =
          decodedData['todos'].map<Todo>((todo) => Todo.fromJson(todo)).toList();

      return todos;
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
