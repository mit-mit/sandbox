class LocalPlatform {
  HostPlatform _host = HostPlatform.current;

  @Deprecated('Use HostPlatform')
  bool get isAndroid => _host.isAndroid;
  @Deprecated('Use NativePlatform')
  String get localHostname => '';
}

class HostPlatform {
  bool get isAndroid => true;
}

class NativePlatform {
  String get localHostname => '';
}
