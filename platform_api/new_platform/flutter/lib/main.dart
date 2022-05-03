import 'package:flutter/material.dart';
import 'package:platform/native.dart';
import 'package:platform/platform.dart';

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
          // GOOD: This code runs as expected on both native and web.
          // BAD: I don't think HostnameWidget() is tree-shaken on web?
          // SLIGHTLY BAD: need to move const into the individual widgets.
          // GOOD: if the isBrowser check is removed we get a build-time failure:
          //   $ flutter run -d chrome
          //      /lib/src/native_platform/local_native_platform.dart:5:8:
          //         Error: Not found: 'dart:io_not_available'
          //      /lib/src/native_platform/local_native_platform.dart:18:36:
          //         Error: Undefined name'Platform'
          children: <Widget>[
            const ProductWidget(),
            if (!Platform.current.isBrowser) const HostnameWidget(),
//            const HostnameWidget(),
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

class HostnameWidget extends StatelessWidget {
  const HostnameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hostName = NativePlatform.current.localHostname;

    return Text('Host name: $hostName');
  }
}
