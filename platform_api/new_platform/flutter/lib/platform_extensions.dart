import 'package:platform/platform.dart';

extension ShouldBeOnPlatform on Platform {
  bool get isNative => !Platform.current.isBrowser;
}
