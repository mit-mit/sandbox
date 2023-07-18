// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:new_platform/platform_extensions.dart';
import 'package:platform/platform.dart';

import 'native_widgets.dart';

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
          children: <Widget>[
            const ProductWidget(),
            // Using HostnameWidget guarded by a platform check
            // should pass analysis and compile for both native and web.
            // Compilers should tree-shake.
            if (Platform.current.isNative) const HostnameWidget(),
          ],
        ),
      ),
    );
  }
}

// This widget uses platform-specific rendering,
// using the Platform.current API.
class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // Supported on all platforms.
    //
    // This should be treated as const by the compiler
    // so that we can optimize based on it.
    final isMac = Platform.current.isMacOS;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (var product in ['Foo1', 'Foo2', 'Foo3'])
          isMac ? Text('i$product') : Text(product)
      ],
    );
  }
}
