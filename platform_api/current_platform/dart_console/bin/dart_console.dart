import 'package:platform/platform.dart' as platform;

// The following works fine on all Dart native platforms.
void main(List<String> arguments) {
  final isMac = const platform.LocalPlatform().isMacOS;
  final hostname = const platform.LocalPlatform().localHostname;

  print('isMac: $isMac.');
  print('hostname: $hostname.');
}
