import 'package:flutter/cupertino.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../../Utils/Color Resources/Color_Resources.dart';

class Calender extends StatelessWidget {
  Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        // Handle date change.
      },
      headerProps : EasyHeaderProps(
          selectedDateStyle : TextStyle(color: ColorResources.gray , fontSize: 17 , fontWeight: FontWeight.w300),
          monthStyle : TextStyle(color: ColorResources.gray , fontSize: 17 , fontWeight: FontWeight.w300)

      ),
      dayProps: EasyDayProps(
        todayStyle: DayStyle(
          monthStrStyle: TextStyle(color: ColorResources.white),
          dayNumStyle: TextStyle(color: ColorResources.white , fontWeight: FontWeight.bold , fontSize: 20),
          dayStrStyle: TextStyle(color: ColorResources.white),
          decoration: BoxDecoration(
            color: ColorResources.orange,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        inactiveDayStyle: DayStyle(
          decoration: BoxDecoration(
            color: ColorResources.transparent,
            borderRadius: BorderRadius.circular(12.0), // Customize shape.
          ),
          monthStrStyle: TextStyle(color: ColorResources.gray),
          dayNumStyle: TextStyle(color: ColorResources.gray ,fontSize: 16),
          dayStrStyle: TextStyle(color: ColorResources.gray),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(color: ColorResources.darkGry , fontWeight: FontWeight.bold , fontSize: 20),
          dayStrStyle: TextStyle(color: ColorResources.darkGry),
          monthStrStyle: TextStyle(color: ColorResources.darkGry),

          decoration: BoxDecoration(
            color: ColorResources.babyOrange,
            borderRadius: BorderRadius.circular(12.0), // Customize shape.
          ),

        ),
      ),
    );
  }
}
