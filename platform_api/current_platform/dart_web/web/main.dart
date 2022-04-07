import 'dart:html';
import 'package:platform/platform.dart' as platform;

void main() {
  final isMac = const platform.LocalPlatform().isMacOS;
  querySelector('#output')?.text = 'Your Dart app is running.';
  querySelector('#web')?.text = 'isMac: $isMac.';
}
