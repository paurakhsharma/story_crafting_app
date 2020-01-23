import 'package:story_crafting_app/story_list/example_story_data.dart'
    as example_data;
import 'package:story_crafting_app/story_list/story.dart';

class FakeStoryListService {
  static const int DELAY_SECONDS = 1;

  // TODO: get stories by language (or language-id maybe?)
  Future<List<Story>> getStories() async {
    return Future<List<Story>>.delayed(
        Duration(seconds: DELAY_SECONDS), () => example_data.stories);
  }
}
