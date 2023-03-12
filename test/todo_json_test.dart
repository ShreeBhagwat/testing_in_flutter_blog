import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:testing_in_flutter_blog/key_constants.dart';
import 'package:testing_in_flutter_blog/model/todo.dart';
import 'package:testing_in_flutter_blog/services/todo_service.dart';

void main() {
  test('Todo json test', () {
    final todo = Todo(1, 'title', false, 1);

    expect(todo.id, 1);
    expect(todo.todo, 20);
    expect(todo.completed, true);
    expect(todo.userId, 10);
  });

  test('Todo Service MOCK HTTP', () async {
    Future<Response> _mockHttp(Request request) async {
      if (request.url.toString().startsWith('https://dummyjson.com/todo')) {
        return Response(mockTodos, 200,
            headers: {HttpHeaders.contentTypeHeader: 'application/json'});
      }

      return throw Exception('failed');
    }

    final apiService = TodoService(MockClient(_mockHttp));

    final quotes = await apiService.getTodos();

    expect(quotes.first.id, 1);
    expect(quotes.first.todo, 'Create testing blog');
    expect(quotes.first.completed, true);
    expect(quotes.first.userId, 1);
  });
}
