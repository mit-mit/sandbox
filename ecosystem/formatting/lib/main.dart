import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Formatting experiments')),
        body: FruitsList(),
      ),
    );
  }
}

class FruitsList extends StatelessWidget {
  FruitsList({super.key});

  final fruits = ['apple', 'pear', 'banana', 'pineapple', 'cherry', 'mango'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Formatting experiments')),
        body: FruitsList(),
      ),
    );
  }
}

class BuildContext2 {}

class FruitsList2 extends StatelessWidget {
  FruitsList2({super.key});

  final fruits = ['apple', 'pear', 'banana', 'pineapple', 'cherry', 'mango'];

  @override
  build(_) {
    return ListView.builder(
      itemCount: fruits.length,
      itemBuilder: (context, index) => ListTile(title: Text(fruits[index])),
    );
  }
}

class FruitsList3 extends StatelessWidget {
  FruitsList3({super.key});

  final fruits = ['apple', 'pear', 'banana', 'pineapple', 'cherry', 'mango'];

  @override
  build(_) {
    return ListView(
      children: [for (var fruit in fruits) ListTile(title: Text(fruit))],
    );
  }
}
