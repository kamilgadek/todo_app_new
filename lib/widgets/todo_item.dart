import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem({
    super.key,
    required this.todo, 
    required this.onToDoChange, 
    required this.deleteFunction,
  });

  final ToDo todo;
  final onToDoChange;
  final deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.grey[100],
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.purple[900],
        ),
        title: Text(
          todo.todoText!,
          
          style: TextStyle(
            fontSize: 16,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          ),
          child: IconButton(
            onPressed: () {
              deleteFunction(todo.id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}