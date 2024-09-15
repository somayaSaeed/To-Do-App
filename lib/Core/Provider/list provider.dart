import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../Local/firebase_utlis.dart';
import '../Model/task_model.dart';

class ListProvider extends ChangeNotifier{
  List<Task> tasksList = [];

  void getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshots =
    await FirebaseUtils.getTasksCollection().get();
    tasksList = querySnapshots.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }




}
