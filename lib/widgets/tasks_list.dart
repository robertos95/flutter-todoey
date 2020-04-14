import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          Task task = taskData.tasks[index];
          return TaskTile(
            taskName: task.name,
            isChecked: task.isDone,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallBack: () {
              taskData.deleteTask(task);
            }
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
