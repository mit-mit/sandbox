import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform/platform.dart' as platform;

void main() {
  runApp(const MaterialApp(title: 'Flutter Demo', home: MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Platform test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            ProductWidget(),
            if (!kIsWeb) HostnameWidget(),
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // BAD: The following will cause a runtime crash on Flutter web
    // VERY BAD: No warnings are at compile-time.
    final isMac = const platform.LocalPlatform().isMacOS;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var product in ['Foo1', 'Foo2', 'Foo3'])
          Text(isMac ? 'i$product' : product)
      ],
    );
  }
}

class HostnameWidget extends StatelessWidget {
  const HostnameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hostName = const platform.LocalPlatform().localHostname;

    return Text('Host name: $hostName');
  }
}
