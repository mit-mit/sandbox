import 'package:platform/platform.dart' as platform;

void main(List<String> arguments) {
  final isMac = const platform.LocalPlatform().isMacOS;
  final hostname = const platform.LocalPlatform().localHostname;

  print('isMac: $isMac.');
  print('hostname: $hostname.');
}
