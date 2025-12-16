import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rightify_method_channel.dart';

abstract class RightifyPlatform extends PlatformInterface {
  /// Constructs a RightifyPlatform.
  RightifyPlatform() : super(token: _token);

  static final Object _token = Object();

  static RightifyPlatform _instance = MethodChannelRightify();

  /// The default instance of [RightifyPlatform] to use.
  ///
  /// Defaults to [MethodChannelRightify].
  static RightifyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RightifyPlatform] when
  /// they register themselves.
  static set instance(RightifyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
