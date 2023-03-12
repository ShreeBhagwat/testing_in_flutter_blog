

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:testing_in_flutter_blog/model/todo.dart';

const loginScreenTextKey = ValueKey('loginScreenTextKey');
const emailTextFormKey = ValueKey('emailTextFormKey');
const passwordTextFormKey = ValueKey('passwordTextFormKey');
const loginButtonKey = ValueKey('loginButtonKey');
const loginCircularProgressKey = ValueKey('loginCircularProgressKey');
const loginButtonTextKey = ValueKey('loginButtonTextKey');
const quotesCircularProgressKey = ValueKey('quotesCircularProgressKey');

const kEmailErrorText = 'Please enter a valid email';
const kPasswordErrorText = 'Password must be at least 6 characters';

final mockQuotesForTesting = [
  Todo(
     1,
     'Test todo 1',
     true,
     1,
  ),
  Todo(
     2,
     'Test todo 2',
     true,
     1,
  ),
  Todo(
     3,
     'Test todo 3',
     true,
     1,
  ),
];

final mockTodos = jsonEncode(data);

final data = {
  "todos": [
    {"id": 1, "todo": "Create testing blog", "completed": true, "userId": 1}
  ],
};
