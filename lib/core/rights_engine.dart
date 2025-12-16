import 'package:rightify/core/types.dart';

class RightsEngine {
  final List<RightLevel> hierarchy;
  final Map<ActionKey, RightLevel> rules;

  RightLevel _currentLevel;

  RightsEngine({
    required this.hierarchy,
    required this.rules,
    required RightLevel initialLevel,
  }) : _currentLevel = initialLevel;

  void setCurrentLevel(RightLevel level) {
    _currentLevel = level;
  }

  bool canPerform(ActionKey action) {
    final requiredLevel = rules[action];
    if (requiredLevel == null) return true;

    return hierarchy.indexOf(_currentLevel) >= hierarchy.indexOf(requiredLevel);
  }
}
