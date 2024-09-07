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
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xFF4196E3), Color(0xFF373598)]),
              ),
              // color: ColorResources.primaryLightColor,
              height: height * 0.13,
            ),
          ],
        )
      ],
    );
  }
}
