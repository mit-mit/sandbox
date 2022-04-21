import 'dart:html';

import 'package:platform/platform.dart' as platform;

void main() {
  // GOOD: The following will trigger a compile time warning in webdev.
  // BAD: The warning could be easier to read.
  final isMac = const platform.LocalPlatform().isMacOS;
  querySelector('#output')?.text = 'Your Dart app is running.';
  querySelector('#web')?.text = 'isMac: $isMac.';
}
