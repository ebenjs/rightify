import 'package:rightify/core/right_source.dart';
import 'package:rightify/core/types.dart';

class FakeRightsSource implements RightsSource {
  RightLevel? _value;

  FakeRightsSource([this._value]);

  @override
  Future<RightLevel?> load() async => _value;

  @override
  Future<void> save(RightLevel level) async {
    _value = level;
  }
}
