import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_model.dart';
import 'package:todoey_flutter/models/task_model_list.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskModelList>(
      create: (context) => TaskModelList(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData().copyWith(
            backgroundColor: Colors.lightBlueAccent,
          ),
          scaffoldBackgroundColor: Colors.lightBlueAccent,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
