import 'package:rightify/core/right_source.dart';
import 'package:rightify/core/types.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRightsSource implements RightsSource {
  final String key;

  SharedPrefsRightsSource({this.key = 'rights_level'});

  @override
  Future<RightLevel?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> save(RightLevel level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, level);
  }
}
