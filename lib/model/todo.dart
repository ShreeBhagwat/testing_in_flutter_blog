class Todo {
  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  Todo(
    this.id,
    this.todo,
    this.completed,
    this.userId,
  );

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      json['id'] as int?,
      json['todo'] as String?,
      json['completed'] as bool?,
      json['userId'] as int?,
    );
  }
}
