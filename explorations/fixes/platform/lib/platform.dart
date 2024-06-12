library platform;

class Platform {
  static Platform _instance = Platform._();
  factory Platform._() => _instance;
  static Platform get current => _instance;
  static NativePlatform? get native => NativePlatform.current;

  bool get isAndroid => false;
}

final class NativePlatform {
  static NativePlatform _instance = NativePlatform._();
  factory NativePlatform._() => _instance;
  static NativePlatform? get current => _instance;

  String get localHostname => 'Fake host';
}
