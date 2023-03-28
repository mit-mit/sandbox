// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as dart_js;
import 'package:flutter/material.dart';
import 'js/date.dart' as js;
import 'js/navigator.dart' as js;

void main() async {
  runApp(const MaterialApp(home: JSInteropNew()));
}

class JSInteropNew extends StatelessWidget {
  const JSInteropNew({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = js.window.navigator;
    final onlineStatus = navigator.onLine;
    final memory = navigator.deviceMemory;

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

class JSInteropOld extends StatelessWidget {
  const JSInteropOld({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator =
        dart_js.JsObject.fromBrowserObject(dart_js.context['navigator']);
    final onlineStatus = navigator['onLine'];
    final memory = navigator['deviceMemory'];

    return Scaffold(
      appBar: AppBar(title: const Text('JS interop vNext')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Browser is ${onlineStatus ? 'online' : 'offline'}'),
            Text('System has $memory GB memory.'),
          ],
        ),
      ),
    );
  }
}
