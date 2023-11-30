import 'package:platform/platform.dart';

// GOOD: The following works fine on all Dart native platforms.
void main(List<String> arguments) {
  final isMac = const LocalPlatform().isMacOS;
  final hostname = const LocalPlatform().localHostname;

  print('isMac: $isMac.');
  print('hostname: $hostname.');
}
