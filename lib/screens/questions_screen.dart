import 'package:flutter/material.dart';
import 'package:story_crafting_app/models/story.dart';
import 'package:story_crafting_app/screens/submit_screen.dart';

class QuestionsScreen extends StatelessWidget {
  final Story story;

  QuestionsScreen({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.home),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              child: TabBar(
                labelColor: Theme.of(context).primaryColor,
                tabs: [
                  Tab(text: "Question 1"),
                  Tab(text: "Question 2"),
                  Tab(text: "Question 3"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Text("Question 1 Text"),
                  Text("Question 2 Text"),
                  Text("Question 3 Text"),
                ],
              ),
            ),
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
                            builder: (context) => SubmitScreen(story: story)),
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
