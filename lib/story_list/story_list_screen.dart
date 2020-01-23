import 'package:flutter/material.dart';
import 'package:story_crafting_app/story_list/story.dart';
import 'package:story_crafting_app/story_list/story_list_service.dart';
import 'package:story_crafting_app/story_list/story_list_widget.dart';

class StoryListScreen extends StatelessWidget {
  final FakeStoryListService storyListService;

  const StoryListScreen({Key key, this.storyListService}) : super(key: key);

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
      body: FutureBuilder<List<Story>>(
        future: storyListService.getStories(),
        builder: (BuildContext context, AsyncSnapshot<List<Story>> snapshot) {
          List<Widget> children = [];
          if (snapshot.hasData) {
            return StoryListWidget(stories: snapshot.data);
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Getting Story List...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
