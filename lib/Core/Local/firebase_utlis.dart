import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/task_model.dart';

class FirebaseUtils{
  static void addTaskToFireStore(){
    FirebaseFirestore.instance.collection(Task.collectionName).
    withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()!),
        toFirestore: (task,option) => task.toFireStore()
    );
  }
}