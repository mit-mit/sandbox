library host;

import 'native.dart';

class Platform {
  static Platform _instance = Platform._();
  factory Platform._() => _instance;
  static Platform get current => _instance;
  static NativePlatform? get native => NativePlatform.current;

  bool get isAndroid => true;
}
