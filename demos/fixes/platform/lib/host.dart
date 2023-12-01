library host;

class HostPlatform {
  static HostPlatform _instance = HostPlatform._();
  factory HostPlatform._() => _instance;
  static HostPlatform get current => _instance;

  bool get isAndroid => true;
}
