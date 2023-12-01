import 'host.dart';
import 'native.dart';

@Deprecated('Use HostPlatform or NativePlatform')
class LocalPlatform {
  HostPlatform _host = HostPlatform.current;
  NativePlatform _native = NativePlatform.current;

  @Deprecated('Use HostPlatform')
  bool get isAndroid => _host.isAndroid;
  @Deprecated('Use NativePlatform')
  String get localHostname => _native.localHostname;
}
