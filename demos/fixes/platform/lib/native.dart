library native;

final class NativePlatform {
  static NativePlatform _instance = NativePlatform._();
  factory NativePlatform._() => _instance;
  static NativePlatform get current => _instance;

  String get localHostname => 'Fake host';
}
