class Story {
  String nameInEnglish;
  String nameInLanguage;
  String languageName;

  Story({this.nameInEnglish, this.nameInLanguage, this.languageName});

  //TODO: add error handling, consider which fields should be optional, etc
  factory Story.fromData(Map<String, dynamic> data) {
    return Story(
      nameInEnglish: data['nameInEnglish'],
      nameInLanguage: data['nameInLanguage'],
      languageName: data['languageName'],
    );
  }
}
