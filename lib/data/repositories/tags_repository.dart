import 'package:lofit/data/db/database.dart';
import 'package:lofit/data/model/tag_model.dart';
import 'package:lofit/data/services/tags_service.dart';

class TagsRepository {
  TagsRepository(Database db) {
    _tagsService = TagsService(db);
  }

  late final TagsService _tagsService;

  List<TagModel> _tags = const [];

  List<TagModel> get tags => _tags;

  Future<void> loadTags() async {
    _tags = await _tagsService.getTags();
  }

  Future<void> addTag(TagModel tag) async {
    final id = await _tagsService.createTag(tag);
    _tags = [..._tags, tag.copyWith(id: id)];
  }

  Future<void> updateTag(TagModel tag) async {
    final index = _tags.indexOf(_tags.firstWhere((test) => test.id == tag.id));
    _tags[index] = tag;
    _tags = [..._tags];
    _tagsService.updateTag(tag);
  }

  Future<void> deleteTag(TagModel tag) async {
    _tags = [..._tags]..remove(tag);
    _tagsService.deleteTag(tag);
  }
}
