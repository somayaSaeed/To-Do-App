import 'package:flutter/cupertino.dart';

import '../../../Utils/Color Resources/Color_Resources.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: ColorResources.primaryLightColor,
              height: height * 0.11,

            )
          ],
        )
      ],
    );
  }
}
