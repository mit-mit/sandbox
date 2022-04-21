import 'dart:html';

//import 'package:platform/native.dart';
import 'package:platform/platform.dart';

void main() {
  // The following all works great:
  final isMac = Platform.current.isMacOS;
  final isBrowser = Platform.current.isBrowser;
  querySelector('#output')?.text = 'Your Dart app is running.';
  querySelector('#mac')?.text = 'isMac: $isMac.';
  querySelector('#browser')?.text = 'isBrowser: $isBrowser.';

  // Uncommenting this line causes a compile-time warning.
  // final hostName = NativePlatform.current.localHostname;
  // querySelector('#output')?.text = 'Your Dart app is running on $hostName.';
}
