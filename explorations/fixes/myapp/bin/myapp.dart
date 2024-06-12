import 'package:platform/local_platform.dart';

main() {
  bool isAndroid = LocalPlatform().isAndroid;
  String host = LocalPlatform().localHostname;
  print('Android: $isAndroid, host: $host');
}

// Expected migration:
// main2() {
//   bool isAndroid = Platform.current.isAndroid;
//   String host = Platform.native!.localHostname;
//   print('Android: $isAndroid, host: $host');
// }
