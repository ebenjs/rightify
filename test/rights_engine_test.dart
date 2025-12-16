import 'package:flutter_test/flutter_test.dart';
import 'package:rightify/core/rights_engine.dart';

void main() {
  final hierarchy = ['free', 'premium', 'gold'];
  final rules = {
    'action_free': 'free',
    'action_premium': 'premium',
    'action_gold': 'gold',
  };

  test('free user can perform free action', () {
    final engine = RightsEngine(
      hierarchy: hierarchy,
      rules: rules,
      initialLevel: 'free',
    );

    expect(engine.canPerform('action_free'), true);
  });

  test('free user cannot perform premium action', () {
    final engine = RightsEngine(
      hierarchy: hierarchy,
      rules: rules,
      initialLevel: 'free',
    );

    expect(engine.canPerform('action_premium'), false);
  });

  test('gold user can perform all actions', () {
    final engine = RightsEngine(
      hierarchy: hierarchy,
      rules: rules,
      initialLevel: 'gold',
    );

    expect(engine.canPerform('action_free'), true);
    expect(engine.canPerform('action_premium'), true);
    expect(engine.canPerform('action_gold'), true);
  });
}
