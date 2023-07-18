import 'package:flutter/material.dart';
// The import here makes it clear that we're relying on a part
// of the platform package that isn't supported everywhere.
import 'package:platform/native.dart';

// This widget calls into the NativePlatform APIs.
class HostnameWidget extends StatelessWidget {
  const HostnameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Using HostnameWidget() unguarded by a platform check should
    // pass analysis, but still trigger a compile/build time error
    // on platforms that don't support it.

    final hostName = NativePlatform.current.localHostname;

    return Text('Host name: $hostName');
  }
}
