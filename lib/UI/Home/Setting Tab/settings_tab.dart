import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFF4196E3), Color(0xFF373598)]),
          ),
          // color: ColorResources.primaryLightColor,
          height: height * 0.13,
        ),
        const Column(
          children: [
             Text('Language:  '),
            Text('Theme:  '),

          ],
        )


      ],
    );
  }
}
