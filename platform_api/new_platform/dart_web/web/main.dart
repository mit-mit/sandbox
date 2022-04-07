import 'dart:html';
import 'package:platform/platform.dart';
// import 'package:platform/native.dart';

void main() {
  final isMac = Platform.current.isMacOS;
  final isBrowser = Platform.current.isBrowser;
  // final hostName = NativePlatform.current.localHostname;
  querySelector('#output')?.text = 'Your Dart app is running.';
  querySelector('#mac')?.text = 'isMac: $isMac.';
  querySelector('#browser')?.text = 'isBrowser: $isBrowser.';
}
