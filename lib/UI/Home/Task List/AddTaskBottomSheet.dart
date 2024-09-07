import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

class AddTaskBottomSheet extends StatefulWidget {
   AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: heigth * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Text('Add New Task',
                style: Theme.of(context).textTheme.titleMedium),
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
                  decoration: InputDecoration(hintText: 'Enter the Task Title'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(

                  decoration:
                      InputDecoration(hintText: 'Enter the Task Description'),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Task Description';
                    }
                    return null;
                  },
                  maxLines: 4,
                ),
                Text(
                  'Select Date',
                ),
                TextButton(
                  onPressed: (){
                    showCalender();
                  },
                  child: Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(onPressed: () {
                  addTask();
                }, child: Text('Add'))
              ],
            )),
          ],
        ),
      ),
    );
  }

  void addTask() {
    if(formKey.currentState?.validate()==true){

    }
  }

  void showCalender()async {
   var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days : 365)));
   selectedDate = chosenDate ?? selectedDate ;
   setState(() {

   });
  }
}
