import 'package:platform/platform.dart';

void main(List<String> arguments) {
  bool onAndroid = LocalPlatform().isAndroid;
  String hostname = LocalPlatform().localHostname;

  print('Android: $onAndroid, host: $hostname');

  final platform = LocalPlatform();
  print(platform.isAndroid);
}
