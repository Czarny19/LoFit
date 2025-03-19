import 'package:drift/drift.dart';
import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/tag_model.dart';

class TagsService {
  const TagsService(this._db);

  final Database _db;

  Future<List<TagModel>> getTags() async {
    final tags = await _db.managers.tags.get();
    return tags.map((tag) => TagModel(id: tag.id, name: tag.name, color: tag.color)).toList();
  }

  Future<int> createTag(TagModel tag) async {
    return await _db.managers.tags.create((o) => o(name: tag.name, color: tag.color), mode: InsertMode.insert);
  }

  Future<void> updateTag(TagModel tag) async {
    await _db.managers.tags
        .filter((f) => f.id.equals(tag.id))
        .update((o) => o(name: Value(tag.name), color: Value(tag.color)));
  }

  Future<void> deleteTag(TagModel tag) async {
    await _db.managers.tags.filter((f) => f.id.equals(tag.id)).delete();
  }
}
