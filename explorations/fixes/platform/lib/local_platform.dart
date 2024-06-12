import 'platform.dart';
import 'native.dart';

@Deprecated('Use Platform or NativePlatform')
class LocalPlatform {
  Platform _host = Platform.current;
  NativePlatform _native = NativePlatform.current!;

  @Deprecated('Use HostPlatform')
  bool get isAndroid => _host.isAndroid;
  @Deprecated('Use NativePlatform')
  String get localHostname => _native.localHostname;
}
