import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Core/Local/firebase_utlis.dart';
import 'package:to_do_app/Core/Model/task_model.dart';
import 'package:to_do_app/Core/Provider/list%20provider.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import '../../../Core/Provider/auth user provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();

  late ListProvider listProvider;
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);

    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.53,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text('Add New Task', style: Theme.of(context).textTheme.bodyLarge),
            Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Task Title';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        title = text;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter the Task Title',
                          hintStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter the Task Description',
                          hintStyle: Theme.of(context).textTheme.bodyMedium),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Task Description';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        description = text;
                      },
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Select Date',
                    ),
                    TextButton(
                      onPressed: () {
                        showCalender();
                      },
                      child: Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorResources.darkGry),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorResources.babyBlue),
                        onPressed: () {
                          addTask();
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(color: ColorResources.white),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      Task task = Task(
          title: title,
          description: description,
          dateTime: selectedDate,
          isDone: true);
      var authProvider = Provider.of<AuthUserProvider>(context, listen: false);
      FirebaseUtils.addTaskToFireStore(task, authProvider.currentUser!.id!)
          .then((value) {
        // Fluttertoast.showToast(
        //     msg: "Task Added",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black26,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
      }).timeout(const Duration(milliseconds: 10), onTimeout: () {
        Fluttertoast.showToast(
            msg: "Task Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
        listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
        Navigator.pop(context);
      });
    }
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    selectedDate = chosenDate ?? selectedDate;
    setState(() {});
  }
}
