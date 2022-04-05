import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Demo',
      home: MyHome1(),
    ),
  );
}

class MyHome1 extends StatelessWidget {
  const MyHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fruits = ['apple', 'banana', 'pear'];

    return Scaffold(
      appBar: AppBar(title: const Text('Constructor tear-offs')),
      body: Column(
        children: [
          Heading('Fruits available'),
          ...fruits.map(Text.new),
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String text;
  const Heading(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline4);
  }
}

class MyHome2 extends StatelessWidget {
  const MyHome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widget = Text.new;
    const fruits = ['apple', 'banana', 'pear'];
    Column col = Function.apply(Column.new, [], {
      Symbol('children'): [...fruits.map(widget)]
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Constructor tear-offs')),
      body: col,
    );
  }
}
