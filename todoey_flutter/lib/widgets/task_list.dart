import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_model.dart';
import 'package:todoey_flutter/models/task_model_list.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = Provider.of<TaskModelList>(context).getTasks();
    return Padding(
      padding: const EdgeInsets.only(bottom: 56.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CheckboxListTile(
            value: tasks[index].isChecked,
            onChanged: (newValue) {
              Provider.of<TaskModelList>(context, listen: false)
                  .toggleTask(index);
            },
            activeColor: Colors.lightBlueAccent,
            title: Text(
              tasks[index].text,
              style: TextStyle(
                decoration:
                    tasks[index].isChecked ? TextDecoration.lineThrough : null,
              ),
            ),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
