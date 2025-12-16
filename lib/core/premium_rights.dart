import 'package:rightify/core/right_source.dart';
import 'package:rightify/core/rights_engine.dart';
import 'package:rightify/core/types.dart';

class PremiumRights {
  static late RightsEngine _engine;
  static late RightsSource _local;

  static Future<void> initialize({
    required List<RightLevel> hierarchy,
    required Map<ActionKey, RightLevel> rules,
    required RightsSource localSource,
    RightsSource? remoteSource,
    RightLevel defaultLevel = 'free',
  }) async {
    _local = localSource;

    final local = await localSource.load();
    final remote = await remoteSource?.load();

    final current = remote ?? local ?? defaultLevel;

    _engine = RightsEngine(
      hierarchy: hierarchy,
      rules: rules,
      initialLevel: current,
    );

    await _local.save(current);
  }

  static bool canPerform(ActionKey action) {
    return _engine.canPerform(action);
  }

  static Future<void> setLevel(RightLevel level) async {
    _engine.setCurrentLevel(level);
    await _local.save(level);
  }
}
