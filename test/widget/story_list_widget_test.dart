import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:story_crafting_app/story_list/story.dart';
import 'package:story_crafting_app/story_list/story_list_widget.dart';

void main() {
  final stories = [
    Story(nameInEnglish: "Isaiah", nameInLanguage: "Исайя"),
    Story(nameInEnglish: "Revelation", nameInLanguage: "открытие"),
  ];

  testWidgets('List of stories includes the English name of each story',
      (WidgetTester tester) async {
    final widget = MaterialApp(home: StoryListWidget(stories: stories));
    await tester.pumpWidget(widget);

    expect(find.text('Isaiah'), findsOneWidget);
    expect(find.text('Revelation'), findsOneWidget);
  });

  testWidgets('List of stories includes the language name of each story',
          (WidgetTester tester) async {
        final widget = MaterialApp(home: StoryListWidget(stories: stories));
        await tester.pumpWidget(widget);

        expect(find.text('Исайя'), findsOneWidget);
        expect(find.text('открытие'), findsOneWidget);
      });
}
