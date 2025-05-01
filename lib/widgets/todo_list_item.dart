import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:imc_tasks_manager/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.todo,
    required this.onDelete,
  });

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Slidable(
          endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.20,
              children: [
                SlidableAction(
                  label: 'Delete',
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  onPressed: (BuildContext context) {onDelete(todo);},
                ),
              ]),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DateFormat('dd/MM/yyyy - HH:mm').format(todo.date),
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),
                ),
                Text(
                  todo.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff00d7f3),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
