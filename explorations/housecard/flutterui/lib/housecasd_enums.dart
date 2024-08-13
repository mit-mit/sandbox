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
    shape: RoundedRectangleBorder(borderRadius: .circular(20)),
    child: Padding(
      padding: .all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(color: .lightBlue, shape: .circle),
        child: Padding(
          padding: .all(15),
          child: DecoratedBox(
            decoration: BoxDecoration(color: .darkBlue, shape: .circle),
            child: Padding(
              padding: .all(10),
              child: Icon(.home_outlined, color: .white),
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
