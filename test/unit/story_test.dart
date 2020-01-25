import 'package:flutter_test/flutter_test.dart';
import 'package:story_crafting_app/story_list/story.dart';

void main() {
  test('Creates story from story data', () {
    final Map<String, dynamic> data = {
      'nameInEnglish': 'storyName',
      'nameInLanguage': 'otherName'
    };

    Story story = Story.fromData(data);

    expect(story.nameInEnglish, 'storyName');
    expect(story.nameInLanguage, 'otherName');
  });
}
