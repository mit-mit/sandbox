import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class HouseWidgetStyled extends StatelessWidget {
  const HouseWidgetStyled({super.key});

  @override
  Widget build(BuildContext context) {
    return HouseCardStyled()
        .alignment(Alignment.center)
        .backgroundColor(MyColors.backgroundGray)
        .width(200)
        .height(200);
  }
}

class HouseCardStyled extends StatelessWidget {
  const HouseCardStyled({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(Icons.home_outlined, color: Colors.white)
          .padding(all: 10)
          .decorated(color: MyColors.darkBlue, shape: BoxShape.circle)
          .padding(all: 15)
          .decorated(color: MyColors.lightBlue, shape: BoxShape.circle)
          .padding(all: 20),
    );
  }
}

class MyColors {
  static Color get backgroundGray => Color(0xffEBECF1);
  static Color get darkBlue => Color(0xff7AC1E7);
  static Color get lightBlue => Color(0xffE8F2F7);
}
