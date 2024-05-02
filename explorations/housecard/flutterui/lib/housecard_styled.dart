import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class HouseCardStyled extends StatelessWidget {
  const HouseCardStyled({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.home_outlined, color: Colors.white)
        .padding(all: 10)
        .decorated(color: Color(0xff7AC1E7), shape: BoxShape.circle)
        .padding(all: 15)
        .decorated(color: Color(0xffE8F2F7), shape: BoxShape.circle)
        .padding(all: 20)
        .card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white)
        .alignment(Alignment.center)
        .backgroundColor(Color(0xffEBECF1));
  }
}
