import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/Color Resources/Color_Resources.dart';
import 'Calender.dart';
import 'Task List Item.dart';

class TaskListTab extends StatelessWidget {
  const TaskListTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[ColorResources.babyBlue, ColorResources.primaryLightColor]),
              ),
              // color: ColorResources.primaryLightColor,
              height: height * 0.13,
            ),
            Calender(),
          ],
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return TaskListItem();
          }),
        )
      ],
    );
  }
}
