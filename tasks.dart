class Tasks {
  String name;
  String description;
  bool completed;

  Tasks(
      {required this.name, required this.description, this.completed = false});

  String getcompleted() => completed ? "Completed" : "Not Completed";

  void setcompleted() {
    completed = true;
  }

  @override
  String toString() {
    return "$name - ${getcompleted()} \n   $description";
  }
}
