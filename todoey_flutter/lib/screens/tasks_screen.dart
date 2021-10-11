import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_model.dart';
import 'package:todoey_flutter/widgets/custom_container.dart';

import 'package:todoey_flutter/widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];
  TextEditingController textController = TextEditingController();
  late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Container(
              color: MediaQuery.of(context).viewInsets.bottom == 0.0
                  ? const Color(0xFF757575)
                  : const Color(0xFF1C5A75),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: CustomContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        children: [
                          const Text(
                            'Add Task',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 32.0,
                            ),
                          ),
                          TextField(
                            autofocus: true,
                            controller: textController,
                            textAlign: TextAlign.center,
                            onChanged: (val) {
                              newTaskTitle = val;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            onPressed: () {
                              textController.clear();
                              setState(() {
                                tasks.add(Task(text: newTaskTitle));
                              });
                              Navigator.pop(context);
                            },
                            color: Colors.lightBlueAccent,
                            minWidth: double.infinity,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                bottom: 30.0,
                right: 30.0,
                left: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '12 tasks',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ),
            Expanded(
              child: CustomContainer(
                child: TaskList(
                  tasks: tasks,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
