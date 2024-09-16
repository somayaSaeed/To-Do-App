import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Core/Provider/list%20provider.dart';
import '../../../Utils/Color Resources/Color_Resources.dart';
import 'Calender.dart';
import 'Task List Item.dart';

class TaskListTab extends StatefulWidget {
  const TaskListTab({super.key});

  @override
  State<TaskListTab> createState() => _TaskListTabState();
}



class _TaskListTabState extends State<TaskListTab> {

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    double height = MediaQuery.of(context).size.height;
    if(listProvider.tasksList.isEmpty){
      listProvider.getAllTasksFromFireStore();
    }

    return Column(

      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      ColorResources.babyBlue,
                      ColorResources.primaryLightColor
                    ]),
              ),

              height: height * 0.13,
            ),
            const Calender(),
          ],


        ),
        SizedBox(height: height*0.015,),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskListItem(
                task: listProvider.tasksList[index],
              );
            },
            itemCount: listProvider.tasksList.length,
          ),
        ),

      ],

    );
  }


}
