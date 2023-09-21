import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/database/task_data.dart';
import 'package:to_do/date_utilties.dart';

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

  static Future<List<Task>> getAllTasks(DateTime selectedDate)async{
    var queruSnapShot = await getTasksCollection().where('dataTime',isEqualTo: ignore(selectedDate).microsecondsSinceEpoch).get();
    List<Task>tasks=queruSnapShot.docs.map((e) => e.data()).toList();
    return tasks;
  }

  static Stream<QuerySnapshot<Task>> listenForTasksRealTimeUpdates(DateTime selectedDate){
    return getTasksCollection().where('dataTime',isEqualTo: ignore(selectedDate).microsecondsSinceEpoch).snapshots();
  }

  static Future<void> deleteTask(Task task)async{
    var deletedtask = getTasksCollection().doc(task.id);
    deletedtask.delete();
  }
}
