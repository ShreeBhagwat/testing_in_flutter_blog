import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:testing_in_flutter_blog/model/todo.dart';

import '../services/todo_service.dart';

class TodoNotifier extends ChangeNotifier {
  final TodoService _todoService;

  TodoNotifier(this._todoService);

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getTodos() async {
    setLoader(true);
    _todos = await _todoService.getTodos();
    setLoader(false);
  }
}

final _client = Client();
final todosNotifier =
    ChangeNotifierProvider((ref) => TodoNotifier(TodoService(_client)));
