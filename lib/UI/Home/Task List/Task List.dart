import 'package:flutter/cupertino.dart';
import 'package:to_do_app/Utils/Color%20Resources/Color_Resources.dart';

import 'Calender.dart';

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
              color: ColorResources.primaryLightColor,
              height: height * 0.12,
            ),
            Calender()
          ],
        )
      ],
    );
  }
}
