library local_platform;

import 'platform.dart';

@Deprecated('Replaced by `Platform`.')
class LocalPlatform {
  Platform _host = Platform.current;
  NativePlatform _native = NativePlatform.current!;

  @Deprecated('Replaced by `Platform.isAndroid`.')
  bool get isAndroid => _host.isAndroid;
  @Deprecated('Replaced by `Platform.native!.localHostname`.')
  String get localHostname => _native.localHostname;
}
