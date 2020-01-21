import 'package:flutter/material.dart';
import 'package:story_crafting_app/sample_data/stories.dart';
import 'package:story_crafting_app/screens/story_steps_screen.dart';

class StoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Story App - Russian",
          key: Key('appbartext'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                print("Settings Clicked");
              },
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: ListView.builder(
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
                      builder: (context) => StoryStepsScreen(story: story)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
