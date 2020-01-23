import 'package:flutter/material.dart';
import 'package:story_crafting_app/story_list/story.dart';

class RecordScreen extends StatelessWidget {
  final Story story;

  RecordScreen({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Record"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.home),
          ),
        ],
      ),
      body: Text("Record Screen"),
    );
  }
}
