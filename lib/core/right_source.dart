import 'package:rightify/core/types.dart';

abstract class RightsSource {
  Future<RightLevel?> load();
  Future<void> save(RightLevel level);
}
