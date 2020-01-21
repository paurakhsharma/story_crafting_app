import 'package:flutter/material.dart';
import 'package:story_crafting_app/models/story.dart';
import 'package:story_crafting_app/screens/record_screen.dart';

class ListenScreen extends StatelessWidget {
  final Story story;

  ListenScreen({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listen"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        // TODO: do I need this Center element?

        child: Column(
          children: [
            Spacer(),
            Text(
              story.nameInEnglish,
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).primaryColor),
            ),
            Text(
              story.nameInLanguage,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordScreen(story: story)),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
