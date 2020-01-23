import 'package:flutter/material.dart';
import 'package:story_crafting_app/screens/story_steps_screen.dart';
import 'package:story_crafting_app/story_list/story.dart';

class StoryListWidget extends StatelessWidget {
  final List<Story> stories;

  const StoryListWidget({
    Key key,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stories.length,
      itemBuilder: (BuildContext context, int index) {
        var story = stories[index];

        return Card(
          child: ListTile(
            key: Key('$index-storytile'),
            title: Text(story.nameInEnglish),
            subtitle: Text(
              story.nameInLanguage,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // TODO: Consider how to refactor this to remove the direct
                  // dependency on the StoryStepsScreen
                    builder: (context) => StoryStepsScreen(story: story)),
              );
            },
          ),
        );
      },
    );
  }
}
