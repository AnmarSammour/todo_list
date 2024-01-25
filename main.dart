import 'dart:io';
import 'Tasks.dart';

void main() {
  List<Tasks> tasks = [];

  while (true) {
    print("\nSelect an option:");
    print("1. Add Task");
    print("2. View Tasks");
    print("3. Complete Task");
    print("4. Delete Task");
    print("5. Exit");

    try {
      var option_num = stdin.readLineSync();
      if (option_num?.isEmpty ?? true) {
        throw FormatException("Invalid option");
      }
      switch (option_num) {
        case "1":
          print("Enter task name:");
          var name = stdin.readLineSync();
          print("Enter task description:");
          var description = stdin.readLineSync();
          tasks.add(Tasks(name: name!, description: description!));
          break;

        case "2":
          if (tasks.isEmpty) {
            print("----- Tasks List -----");
            print("No tasks in this list");
          } else {
            print("----- Tasks List -----");
            for (var i = 0; i < tasks.length; i++) {
              print("\n${i + 1}. ${tasks[i]}");
            }
          }
          break;

        case "3":
          print("Enter the task number to complete:");
          String task_num1 = stdin.readLineSync() ?? "";
          int task_num = int.parse(task_num1);

          if (task_num > 0 && task_num <= tasks.length) {
            tasks[task_num - 1].setcompleted();
            print("Task $task_num completed successfully");
          } else {
            print("Invalid task number");
          }
          break;

        case "4":
          print("Enter the task number to delete:");
          String delete_num1 = stdin.readLineSync() ?? "";
          int delete_num = int.parse(delete_num1);
          if (delete_num > 0 && delete_num <= tasks.length) {
            tasks.removeAt(delete_num - 1);
            print("The task has been deleted");
          } else {
            print("Invalid task number");
          }
          break;

        case "5":
          print("The program has been exited");
          return;

        default:
          print("Invalid input 🥺 Please enter a valid option");
      }
    } catch (e) {
      print(e);
    }
  }
}
