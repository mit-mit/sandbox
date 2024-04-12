import 'package:flutter/material.dart';
import 'housecard_standard.dart';
import 'housecard_styled.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(children: [
          Expanded(child: HouseCardStandard()),
          Expanded(child: HouseCardStyled()),
        ]),
      ),
    ),
  );
}
