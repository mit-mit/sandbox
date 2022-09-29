import 'package:platform/native.dart';
import 'package:platform/platform.dart';

// GOOD: This all works great.
void main(List<String> arguments) {
  // Supported on all platforms.
  final isMac = Platform.current.isMacOS;

  // Native-only API.
  final hostName = NativePlatform.current.localHostname;

  print('isMac: $isMac.');
  print('hostname: $hostName.');
}
