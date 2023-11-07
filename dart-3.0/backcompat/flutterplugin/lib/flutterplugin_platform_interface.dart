import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutterplugin_method_channel.dart';

abstract class FlutterpluginPlatform extends PlatformInterface {
  /// Constructs a FlutterpluginPlatform.
  FlutterpluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterpluginPlatform _instance = MethodChannelFlutterplugin();

  /// The default instance of [FlutterpluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterplugin].
  static FlutterpluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterpluginPlatform] when
  /// they register themselves.
  static set instance(FlutterpluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
