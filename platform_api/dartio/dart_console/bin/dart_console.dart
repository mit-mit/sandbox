import 'dart:io';

void main(List<String> arguments) {
  final onAndroid = Platform.isAndroid;
  final hostname = Platform.localHostname;

  print('onAndroid: $onAndroid.');
  print('hostname: $hostname.');
}
