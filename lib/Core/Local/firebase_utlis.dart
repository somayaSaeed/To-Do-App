import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/Core/Model/user%20model.dart';

import '../Model/task_model.dart';

class FirebaseUtils {

  static CollectionReference<Task> getTasksCollection(String uId) {
    return getUsersCollection().doc(uId)
        .collection(Task.collectionName)
        .withConverter<Task>(
            fromFirestore: (snapshot, options) =>
                Task.fromFireStore(snapshot.data()!),
            toFirestore: (task, option) => task.toFireStore());
  }

  static Future<void> addTaskToFireStore(Task task , String uId) {
    var taskCollection = getTasksCollection(uId);

    /// collection
    DocumentReference<Task> taskDocRef = taskCollection.doc();

    /// document
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
  }

  static Future<void> deleteTaskCollection(Task task , String uId) {
    return getTasksCollection(uId).doc(task.id).delete();
  }

  static Future<void> isDone(Task task , String uId)async {
    return getTasksCollection(uId).doc(task.id).update({
      'isDone' : !task.isDone
    });

  }

  static Future<void> editTask(Task task , String uId ) async{
    return getTasksCollection(uId).doc(task.id).update(task.toFireStore());
  }
  
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
            fromFirestore: ((snapshot, option) =>
                MyUser.fromFireStore(snapshot.data()!)),
            toFirestore: (myUser, option) => myUser.toFireStore());
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String uId) async {
    var querySnapshot = await getUsersCollection().doc(uId).get();
    return querySnapshot.data();
  }

}
