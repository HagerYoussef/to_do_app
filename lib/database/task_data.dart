class Task {
  static const String collectionName='Tasks';
  String? id;
  String? title;
  String? description;
  DateTime? dataTime;
  bool? isDone;
  Task({
    this.id,
    this.title,
    this.description,
    this.dataTime,
    this.isDone,
  });
  Task.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            title: data['title'],
            description: data['description'],
            dataTime: DateTime.fromMicrosecondsSinceEpoch(data['dataTime']),
            isDone: data['isDone']);

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dataTime': dataTime?.microsecondsSinceEpoch,
      'isDone': isDone,
    };
  }
}
