import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Core/Local/firebase_utlis.dart';

import '../../../Core/Model/task_model.dart';
import '../../../Core/Provider/auth user provider.dart';
import '../../../Core/Provider/list provider.dart';
import '../../../Utils/Color Resources/Color_Resources.dart';
import '../Edit Task/Edit Task.dart';

class TaskListItem extends StatefulWidget {
  Task task;
  TaskListItem({super.key, required this.task});

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var listProvider = Provider.of<ListProvider>(context);
    var authProvider = Provider.of<AuthUserProvider>(context);

    return Container(
      margin:  EdgeInsets.symmetric(vertical: height*.02, horizontal: width*.02),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                FirebaseUtils.deleteTaskCollection(
                        widget.task, authProvider.currentUser!.id!)
                    .then((value) {
                  // Fluttertoast.showToast(
                  //     msg: "Task Deleted",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.black26,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0
                  // );
                  listProvider
                      .getAllTasksFromFireStore(authProvider.currentUser!.id!);
                }).timeout(const Duration(milliseconds: 20), onTimeout: () {
                  Fluttertoast.showToast(
                      msg: "Task Deleted",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black26,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  listProvider
                      .getAllTasksFromFireStore(authProvider.currentUser!.id!);
                });
              },
              backgroundColor: ColorResources.red,
              foregroundColor: ColorResources.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context ,
                EditScreen.routName ,
                arguments: widget.task,
              );
            },
            child: Container(
              height: height * 0.15,
              width: width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorResources.white),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 17, right: 10),
                    color: !widget.task.isDone
                        ? ColorResources.green
                        : ColorResources.babyBlue,
                    height: height * 0.09,
                    width: width * 0.0055,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 19.0, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.task.title,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: !widget.task.isDone
                                          ? ColorResources.green
                                          : ColorResources.babyBlue,
                                    ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.task.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// add action
                      FirebaseUtils.isDone(widget.task, authProvider.currentUser!.id!);
                      widget.task.isDone = !widget.task.isDone;
                      listProvider.getAllTasksFromFireStore(
                          authProvider.currentUser!.id!);

                      setState(() {});
                    },
                    child: !widget.task.isDone
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Done!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: ColorResources.green)),
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: ColorResources.babyBlue,
                                borderRadius: BorderRadius.circular(12)),
                            height: height * 0.059,
                            width: width * 0.16,
                            child: Icon(
                              Icons.check,
                              color: ColorResources.white,
                              size: 30,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
