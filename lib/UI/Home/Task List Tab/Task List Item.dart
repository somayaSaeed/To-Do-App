import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Core/Model/task_model.dart';
import '../../../Utils/Color Resources/Color_Resources.dart';

class TaskListItem extends StatelessWidget {
  Task task;
  TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10),
          height: height * 0.13,
          width: width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorResources.white),
          child: Row(
            children: [
              // الخط العمودي الأول
              Container(
                margin: const EdgeInsets.only(left: 17),
                color: ColorResources.babyBlue,
                height: height * 0.07,
                width: width * 0.0025,
              ),

              // المساحة التي تحتوي على النصوص
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 19.0, left: 10), // left padding to give space after vertical line
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // عنوان التاسك
                      Text(
                        task.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis, // لإضافة النقاط إذا تجاوز النص
                      ),
                      // وصف التاسك
                      Text(
                        task.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis, // لإضافة النقاط إذا تجاوز النص
                      ),
                    ],
                  ),
                ),
              ),

              // الـ Box الذي يحتوي على علامة الصح
              Padding(
                padding: const EdgeInsets.only(right: 17.0, left: 17),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorResources.babyBlue,
                      borderRadius: BorderRadius.circular(12)),
                  height: height * 0.039,
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
      ],
    );
  }
}
