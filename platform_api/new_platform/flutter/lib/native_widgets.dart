// Annotate that this whole library is native only!
@Platforms('Native')
library;

import 'package:flutter/material.dart';
import 'package:platform/native.dart';
import 'package:platform/platform.dart';

// This widget calls into the NativePlatform APIs.
class HostnameWidget extends StatelessWidget {
  const HostnameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hostName = NativePlatform.current.localHostname;

    return Text('Host name: $hostName');
  }
}
