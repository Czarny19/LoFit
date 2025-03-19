import 'package:drift/drift.dart';
import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/pref_model.dart';

class PrefsService {
  const PrefsService(this._db);

  final Database _db;

  Future<bool> checkIfPrefsExist() async {
    return _db.managers.prefs.exists();
  }

  Future<PrefModel> getPrefs() async {
    final pref = await _db.managers.prefs.getSingle();

    return PrefModel(
      userName: pref.userName,
      dailyKcal: pref.dailyKcal,
      dailyProteins: pref.dailyProteins,
      dailyCarbs: pref.dailyCarbs,
      dailyFats: pref.dailyFats,
    );
  }

  Future<void> createPrefs(PrefModel prefs) async {
    await _db.managers.prefs.create(
      (o) => o(
        userName: prefs.userName,
        dailyKcal: prefs.dailyKcal,
        dailyProteins: prefs.dailyProteins,
        dailyFats: prefs.dailyFats,
        dailyCarbs: prefs.dailyCarbs,
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> updatePrefs(PrefModel prefs) async {
    await _db.managers.prefs.update(
      (o) => o(
        dailyKcal: Value(prefs.dailyKcal),
        dailyProteins: Value(prefs.dailyProteins),
        dailyFats: Value(prefs.dailyFats),
        dailyCarbs: Value(prefs.dailyCarbs),
      ),
    );
  }
}
