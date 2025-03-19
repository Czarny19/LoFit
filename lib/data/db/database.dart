import 'dart:io' show File;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

part 'database.g.dart';

part 'entities/foods.dart';

part 'entities/meals.dart';

part 'entities/prefs.dart';

part 'entities/products.dart';

part 'entities/recipe_products.dart';

part 'entities/recipe_steps.dart';

part 'entities/recipe_tags.dart';

part 'entities/recipes.dart';

part 'entities/tags.dart';

@DriftDatabase(tables: [Foods, Meals, Prefs, Products, Recipes, RecipeProducts, RecipeSteps, RecipeTags, Tags])
class Database extends _$Database {
  Database() : super(_openConnection());

  static Database instance() => Database();

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {}
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
