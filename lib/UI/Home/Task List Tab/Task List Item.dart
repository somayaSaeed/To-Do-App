import 'package:flutter/material.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import '../../../Core/Model/task_model.dart';

class TaskListItem extends StatelessWidget {
   Task task ;
   TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10 , ),
          height: height * 0.13,
          width: width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorResources.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 17),
                color: ColorResources.babyBlue,
                height: height * 0.07,
                width: width * 0.0025,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19.0 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      task.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,


                    ),
                  ],
                ),
              )
              ,
              Padding(
                padding: const EdgeInsets.only(right: 17.0 ,left: 17),
                child: Container(

                  decoration: BoxDecoration(
                    color: ColorResources.babyBlue,
                    borderRadius: BorderRadius.circular(12)

                  ),
                  height: height*0.039,
                  width: width*0.16,
                  child: Icon(
                    Icons.check ,
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
