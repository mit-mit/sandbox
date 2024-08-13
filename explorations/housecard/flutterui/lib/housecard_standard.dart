import 'package:flutter/material.dart';

class HouseWidgetStandard extends StatelessWidget {
  const HouseWidgetStandard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(color: MyColors.backgroundGray),
        child: Align(
          alignment: Alignment.center,
          child: HouseCardStandard(),
        ),
      ),
    );
  }
}

class HouseCardStandard extends StatelessWidget {
  const HouseCardStandard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: MyColors.lightBlue,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: MyColors.darkBlue,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyColors {
  static Color get backgroundGray => Color(0xffEBECF1);
  static Color get darkBlue => Color(0xff7AC1E7);
  static Color get lightBlue => Color(0xffE8F2F7);
}
