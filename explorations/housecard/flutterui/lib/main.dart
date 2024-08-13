import 'package:flutter/material.dart';
import 'original.dart';
import 'housecard_standard.dart';
import 'housecard_styled.dart';
import 'housecard_positional.dart' show HouseWidgetPositional;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              HouseWidgetOriginal(),
              HouseWidgetStandard(),
              HouseWidgetPositional(),
              HouseWidgetStyled(),
            ],
          ),
        ),
      ),
    ),
  );
}
