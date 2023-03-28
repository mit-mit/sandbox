import 'package:flutter/material.dart';
import 'js/date.dart' as js;
import 'js/navigator.dart' as js;

void main() async {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final onlineStatus = js.window.navigator.onLine;
    final memory = js.window.navigator.deviceMemory;

    final now = js.Date.current();

    return Scaffold(
      appBar: AppBar(title: const Text('JS interop vNext')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Browser is ${onlineStatus ? 'online' : 'offline'}'),
            Text('System has $memory GB memory.'),
            Text('Today is ${now.toLocaleDateString('en-US')}'),
          ],
        ),
      ),
    );
  }
}
