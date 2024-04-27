class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id, 
    required this.todoText, 
    this.isDone = false,
    });

    static List<ToDo> todoList() {
      return [
        ToDo(id: '01', todoText: 'Morning Excercise', isDone: true),
        ToDo(id: '02', todoText: 'Buy Book', isDone: true),
        ToDo(id: '03', todoText: 'Make app', isDone: true),
        ToDo(id: '04', todoText: 'Read Book', ),
        ToDo(id: '05', todoText: 'Clean room', ),
        ToDo(id: '06', todoText: 'Go to party', ),
      ];
    }
}