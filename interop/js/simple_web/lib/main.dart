// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as dart_js;
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

void main() async {
  runApp(const MaterialApp(home: MainWidget()));
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JS interop vNext')),
      body: const Center(
        child: Column(
          children: [
            Text('New:'),
            JSInteropNew(),
            Text('Old:'),
            JSInteropOld(),
          ],
        ),
      ),
    );
  }
}

class JSInteropNew extends StatelessWidget {
  const JSInteropNew({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = web.window.navigator;
    final onlineStatus = navigator.onLine;
    final agent = navigator.userAgent;

    return Text('Browser $agent is ${onlineStatus ? 'online' : 'offline'}');
  }
}

class JSInteropOld extends StatelessWidget {
  const JSInteropOld({super.key});

  @override
  Widget build(BuildContext context) {
    final window =
        dart_js.JsObject.fromBrowserObject(dart_js.context['window']);
    final navigator = window['navigator'];
    final onlineStatus = navigator['onLine'];
    final agent = navigator['userAgent'];

    return Text('Browser $agent is ${onlineStatus ? 'online' : 'offline'}');
  }
}
