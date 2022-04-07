import 'package:platform/platform.dart';
import 'package:platform/native.dart';

void main(List<String> arguments) {
  final isMac = Platform.current.isMacOS;
  final hostName = NativePlatform.current.localHostname;

  print('isMac: $isMac.');
  print('hostname: $hostName.');
}
