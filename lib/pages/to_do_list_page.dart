import 'package:flutter/material.dart';
import 'package:imc_tasks_manager/models/todo.dart';
import 'package:imc_tasks_manager/repositories/todo_repository.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  final TextEditingController taskInputController;

  const TodoListPage({super.key, required this.taskInputController});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> tarefas = [];
  Todo? deletedTarefa;
  int? deletedTarefaPos;
  String? errorText;

  @override
  void initState() {
    super.initState();
    if (widget.taskInputController.text.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        addSuggestionAsTask(widget.taskInputController.text);
        widget.taskInputController.clear();
      });
    }
    todoRepository.getTodoList().then((value) {
      setState(() {
        tarefas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Digite sua nova tarefa',
                      hintText: 'Ex: Marcar Consulta com uma nutricionista',
                      errorText: errorText,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    String text = todoController.text;
                    if (text.isEmpty) {
                      setState(() {
                        errorText = 'O campo título não pode estar vazio!';
                      });
                      return;
                    }

                    setState(() {
                      Todo newTodo = Todo(
                        title: text,
                        date: DateTime.now(),
                      );
                      tarefas.add(newTodo);
                      errorText = null;
                    });
                    todoController.clear();
                    todoRepository.saveTodoList(tarefas);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(14)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Flexible(
                child: SizedBox(
              height: 320,
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (Todo tarefa in tarefas)
                    TodoListItem(
                      todo: tarefa,
                      onDelete: onDelete,
                    ),
                ],
              ),
            )),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Você possui ${tarefas.length} tarefas pendentes',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: showDeleteTodosConfirmationDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Limpar tudo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addSuggestionAsTask(String suggestion) {
    setState(() {
      if (suggestion.isNotEmpty) {
        tarefas.add(Todo(title: suggestion, date: DateTime.now()));
        todoController.clear();
        todoRepository.saveTodoList(tarefas);
      }
    });
  }

  void onDelete(Todo todo) {
    deletedTarefa = todo;
    deletedTarefaPos = tarefas.indexOf(todo);

    setState(() {
      tarefas.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi removido com sucesso',
          style: const TextStyle(color: Color(0xff060708)),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: "Desfazer",
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              tarefas.insert(
                deletedTarefaPos!,
                deletedTarefa!,
              );
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
    todoRepository.saveTodoList(tarefas);
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deseja excluir todas as tarefas?'),
        content: const Text(
            "Ao confirmar você estará excluindo todas as tarefas já criadas, essa ação não poderá ser desfeita. Você realmente deseja apagar todas as tarefas?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style:
                TextButton.styleFrom(foregroundColor: const Color(0xff00d7f3)),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            style:
                TextButton.styleFrom(foregroundColor: const Color(0xffdf040b)),
            child: Text('Limpar Tudo'),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      tarefas.clear();
    });
    todoRepository.saveTodoList(tarefas);
  }
}
