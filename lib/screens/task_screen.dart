import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';

class TaskScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskProviderInstance = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: ListView.builder(
        itemCount: taskProviderInstance.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProviderInstance.tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => taskProviderInstance.deleteTask(index),
            ),
            onTap: () => taskProviderInstance.toggleTaskStatus(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String title = '';
              return AlertDialog(
                title: Text("New Task"),
                content: TextField(
                  onChanged: (value) => title = value,
                  decoration: InputDecoration(hintText: "Enter task title"),
                ),
                actions: [
                  TextButton(
                    child: Text("Add"),
                    onPressed: () {
                      taskProviderInstance.addTask(title);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}