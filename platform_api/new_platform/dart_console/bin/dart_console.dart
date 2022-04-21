import 'package:platform/native.dart';
import 'package:platform/platform.dart';

// GOOD: This all works great.
void main(List<String> arguments) {
  final isMac = Platform.current.isMacOS;
  final hostName = NativePlatform.current.localHostname;

  print('isMac: $isMac.');
  print('hostname: $hostName.');
}
