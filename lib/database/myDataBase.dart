import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/database/task_data.dart';

class MyDataBase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(fromFirestore: (snapshot, options) {
      return Task.fromFireStore(snapshot.data()!);
    }, toFirestore: (task, options) {
      return task.toFireStore();
    });
  }

  static Future<void> insertTask(Task task) async {
    var taskCollection = getTasksCollection();
    var doc = taskCollection.doc();
    task.id = doc.id;
    doc.set(task);
  }
}
