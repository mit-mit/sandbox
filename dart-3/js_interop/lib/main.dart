import 'package:flutter/material.dart';
import 'js/date.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = Date.current();
    final io = Date('May 10, 2023 10:00 GMT-7');

    final largeText = Theme.of(context).textTheme.headlineMedium;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('JS interop vNext'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Today is ${now.getFullYear()} / ${now.getMonth()} / ${now.getDay()}',
              style: largeText,
            ),
            Text(
              'IO is on: ${io.getFullYear()} / ${io.getMonth()} / ${io.getDay()}',
              style: largeText,
            ),
            //Text(io.toPrimitive),
          ],
        ),
      ),
    );
  }
}
