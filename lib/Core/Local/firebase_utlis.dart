import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/task_model.dart';

class FirebaseUtils{
  static CollectionReference<Task> getTasksCollection(){
    return
      FirebaseFirestore.instance.collection(Task.collectionName).
      withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()!),
    toFirestore: (task,option) => task.toFireStore());
  }

  static Future<void> addTaskToFireStore(Task task){
    var taskCollection = getTasksCollection(); /// collection
    DocumentReference<Task> taskDocRef = taskCollection.doc(); /// document
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
  }
}