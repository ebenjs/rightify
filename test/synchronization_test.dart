import 'package:rightify/core/premium_rights.dart';
import 'package:test/test.dart';

import 'fake_right_source.dart';

void main() {
  test('remote source overrides local source', () async {
    final local = FakeRightsSource('free');
    final remote = FakeRightsSource('gold');

    await PremiumRights.initialize(
      hierarchy: ['free', 'premium', 'gold'],
      rules: {'export_pdf': 'gold'},
      localSource: local,
      remoteSource: remote,
    );

    expect(PremiumRights.canPerform('export_pdf'), true);
  });

  test('local source used when remote is null', () async {
    final local = FakeRightsSource('premium');

    await PremiumRights.initialize(
      hierarchy: ['free', 'premium', 'gold'],
      rules: {'export_pdf': 'gold'},
      localSource: local,
    );

    expect(PremiumRights.canPerform('export_pdf'), false);
  });
}
