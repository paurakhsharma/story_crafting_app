import 'package:story_crafting_app/story_list/example_story_data.dart'
    as example_data;
import 'package:story_crafting_app/story_list/story.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoryListService {
  // TODO: get stories by language (or language-id maybe?)
  Future<List<Story>> getStories() async {
    final Firestore _firestore = Firestore.instance;
    DocumentSnapshot chosenLanguage;

    // TODO: extract getting language options into method that returns model, etc
    QuerySnapshot languages =
        await _firestore.collection('languages').getDocuments();
    languages.documents.forEach((DocumentSnapshot document) {
      // Eventually the user will pick a language, but for now use Russian.
      if (document.data['name'] == 'Russian') {
        chosenLanguage = document;
      }
    });

    QuerySnapshot englishStories = await _firestore
        .collection('languages')
        .document(chosenLanguage.documentID)
        .collection('stories')
        .orderBy('version')
        .getDocuments();

    // TODO: Filter out all but the most recent version of each story.
    // Will need to think more about how to do this and if the db structure
    // needs to change.
    return englishStories.documents
        .map((DocumentSnapshot story) => Story.fromData(story.data))
        .toList();
  }
}

class FakeStoryListService implements StoryListService {
  // This value can be tweaked to test loading animations, etc.
  static const int DELAY_SECONDS = 0;

  Future<List<Story>> getStories() async {
    return Future<List<Story>>.delayed(
        Duration(seconds: DELAY_SECONDS), () => example_data.stories);
  }
}
