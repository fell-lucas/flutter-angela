import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_model.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<Task>? tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task>? tasks;

  @override
  void initState() {
    super.initState();
    tasks = widget.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: tasks![index].isChecked,
            onChanged: (newValue) {
              setState(() {
                tasks![index].toggleDone();
              });
            },
            activeColor: Colors.lightBlueAccent,
            title: Text(
              tasks![index].text,
              style: TextStyle(
                decoration:
                    tasks![index].isChecked ? TextDecoration.lineThrough : null,
              ),
            ),
          );
        },
        itemCount: tasks!.length,
      ),
    );
  }
}
