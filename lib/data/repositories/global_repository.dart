import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/pref_model.dart';
import 'package:lofit/data/services/prefs_service.dart';

class GlobalRepository {
  GlobalRepository() {
    _prefService = PrefsService(_db);
  }

  final _db = Database.instance();

  late final PrefsService _prefService;

  PrefModel? _prefs;

  Database get db => _db;

  PrefModel get prefs => _prefs ?? emptyPrefs;

  Future<bool> prefsExist() async {
    return _prefService.checkIfPrefsExist();
  }

  Future<void> loadPrefs() async {
    if (_prefs == null) {
      _prefService.getPrefs().then((value) => _prefs = value);
    }
  }

  Future<void> savePrefs(PrefModel prefs) async {
    await _prefService.createPrefs(prefs);
    _prefs = prefs;
  }

  Future<void> updatePrefs(PrefModel prefs) async {
    await _prefService.updatePrefs(prefs);
    _prefs = prefs;
  }
}
