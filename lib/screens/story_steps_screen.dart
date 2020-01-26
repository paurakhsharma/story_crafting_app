import 'package:flutter/material.dart';
import 'package:story_crafting_app/screens/questions_screen.dart';
import 'package:story_crafting_app/screens/record_screen.dart';
import 'package:story_crafting_app/screens/submit_screen.dart';
import 'package:story_crafting_app/story_list/story.dart';
import 'package:story_crafting_app/widgets/step_widget.dart';
import 'listen_screen.dart';

class StoryStepsScreen extends StatelessWidget {
  final Story story;

  StoryStepsScreen({Key key, @required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${story.nameInEnglish} - ${story.languageName}',
          key: Key('appbartext'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.home,
              key: Key('homeIcon'),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StepWidget(
              iconData: Icons.play_arrow,
              stepNumber: 1,
              stepName: "Listen",
              onTap: (BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListenScreen(story: story)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StepWidget(
              iconData: Icons.mic,
              stepNumber: 2,
              stepName: "Record",
              onTap: (BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecordScreen(story: story)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StepWidget(
              iconData: Icons.question_answer,
              stepNumber: 3,
              stepName: "Questions",
              onTap: (BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionsScreen(story: story)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StepWidget(
              iconData: Icons.file_upload,
              stepNumber: 4,
              stepName: "Submit",
              onTap: (BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubmitScreen(story: this.story)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
