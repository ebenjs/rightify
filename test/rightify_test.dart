import 'package:flutter_test/flutter_test.dart';
import 'package:rightify/rightify.dart';
import 'package:rightify/rightify_platform_interface.dart';
import 'package:rightify/rightify_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRightifyPlatform
    with MockPlatformInterfaceMixin
    implements RightifyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RightifyPlatform initialPlatform = RightifyPlatform.instance;

  test('$MethodChannelRightify is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRightify>());
  });

  test('getPlatformVersion', () async {
    Rightify rightifyPlugin = Rightify();
    MockRightifyPlatform fakePlatform = MockRightifyPlatform();
    RightifyPlatform.instance = fakePlatform;

    expect(await rightifyPlugin.getPlatformVersion(), '42');
  });
}
