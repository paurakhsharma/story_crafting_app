import 'package:flutter/material.dart';
import 'package:story_crafting_app/story_list/story_list_screen.dart';
import 'package:story_crafting_app/story_list/story_list_service.dart';

class MyApp extends StatelessWidget {
  final FakeStoryListService storyListService;

  MyApp({Key key, @required this.storyListService}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Story Crafting',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[600],
        accentColor: Colors.lightBlue[600],
      ),
      home: StoryListScreen(storyListService: storyListService),
    );
  }
}
