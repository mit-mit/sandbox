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
            HostnameWidget(),
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
    final isMac = const platform.LocalPlatform().isMacOS;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var product in ['Foo1', 'Foo2', 'Foo3'])
          isMac ? Text('i$product') : Text(product)
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
