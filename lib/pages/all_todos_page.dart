import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_in_flutter_blog/model/todo.dart';

import '../notifiers/todo_notifier.dart';

class AllTodoPage extends ConsumerStatefulWidget {
  const AllTodoPage({super.key});

  @override
  ConsumerState<AllTodoPage> createState() => _AllTodoPageState();
}

class _AllTodoPageState extends ConsumerState<AllTodoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => ref.read(todosNotifierProvider).getTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final todosProvider = ref.watch(todosNotifierProvider);
            return todosProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: todosProvider.todos.length,
                    itemBuilder: (context, index) {
                      Todo todo = todosProvider.todos[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 2.0, bottom: 2.0, left: 8.0, right: 8.0),
                        child: Card(
                          color: Color.fromARGB(255, 224, 222, 222),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(todo.todo!),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
