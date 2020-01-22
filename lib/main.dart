import 'package:flutter/material.dart';
import 'package:story_crafting_app/screens/story_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[600],
        accentColor: Colors.lightBlue[600],
      ),
      home: StoryListScreen(),
    );
  }
}
