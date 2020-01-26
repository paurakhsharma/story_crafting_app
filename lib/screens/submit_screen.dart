import 'package:flutter/material.dart';
import 'package:story_crafting_app/story_list/story.dart';
import 'package:story_crafting_app/utils/constants.dart';

enum gender { male, female }

class SubmitScreen extends StatefulWidget {
  final Story story;

  SubmitScreen({Key key, @required this.story}) : super(key: key);

  @override
  _SubmitScreenState createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  int age;
  String homeInformation;
  String additionalNotes;
  gender selectedGender = gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Submit"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.home),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kLabelStyle(context),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              print('Age: $value');
                              age = int.parse(value);
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Gender',
                              style: kLabelStyle(context),
                            ),
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          Radio(
                            value: gender.male,
                            groupValue: selectedGender,
                            onChanged: (value) => setState(() {
                              selectedGender = value;
                            }),
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          Radio(
                            value: gender.female,
                            groupValue: selectedGender,
                            onChanged: (value) => setState(() {
                              selectedGender = value;
                            }),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Home infromation (rural or urban)',
                            style: kLabelStyle(context),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              print('Home infromation: $value');
                              homeInformation = value;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Additional Notes',
                            style: kLabelStyle(context),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              print('Additional Notes: $value');
                              additionalNotes = value;
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                        color: Colors.black12,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10.0),
                        onPressed: () {
                          print('Saved :)');
                        },
                      ),
                      FlatButton(
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10.0),
                        onPressed: () {
                          print('Submited :)');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
