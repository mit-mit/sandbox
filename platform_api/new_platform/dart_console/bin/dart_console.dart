import 'package:platform/native.dart';
// ignore: unnecessary_import
import 'package:platform/host.dart';

// GOOD: This all works great.
void main(List<String> arguments) {
  // Supported on all platforms.
  final isMac = HostPlatform.current.isMacOS;

  // Native-only API.
  final hostName = NativePlatform.current.localHostname;

  print('isMac: $isMac.');
  print('hostname: $hostName.');
}
