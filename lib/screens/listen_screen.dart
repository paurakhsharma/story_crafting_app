import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:story_crafting_app/models/story.dart';
import 'package:story_crafting_app/screens/record_screen.dart';
import 'package:story_crafting_app/utils/sound_utils.dart';

class ListenScreen extends StatefulWidget {
  final Story story;

  ListenScreen({Key key, @required this.story}) : super(key: key);

  @override
  _ListenScreenState createState() => new _ListenScreenState();
}

class _ListenScreenState extends State<ListenScreen> {
  double _duration = 10;
  double _position = 0;
  String _timeText = "00:00:00";
  String _durationText = "00:00:00";

  bool _playFromBuffer = false;
  String _path = "assets/030_BirthofMoses.mp3";

  FlutterSound audioPlayer;

  StreamSubscription _playerSubscription;

  @override
  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    audioPlayer = new FlutterSound();
  }

  void startPlayer() async{
    try {
      await SoundUtils.startPlayer(audioPlayer, MEDIA_TYPE.ASSET, _path);

      await audioPlayer.setVolume(1.0);

      _playerSubscription = audioPlayer.onPlayerStateChanged.listen((e) {
        if (e != null) {
          _position = e.currentPosition;
          _duration = e.duration;


          this.setState(() {
            this._timeText = SoundUtils.formatTime(_position);
            this._durationText = SoundUtils.formatTime(_duration);
          });
        }
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void pausePlayer() {
    audioPlayer.pausePlayer();
  }

  bool isPlaying() {
    return audioPlayer.audioState == t_AUDIO_STATE.IS_PLAYING;
  }

  void replay() {
    // TODO: implement
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              widget.story.nameInEnglish,
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).primaryColor),
            ),
            Text(
              widget.story.nameInLanguage,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: isPlaying() ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  tooltip: 'Play',
                  onPressed: isPlaying() ? () => pausePlayer() : () => startPlayer(),
                  color: Theme.of(context).primaryColor,
                ),
                Expanded( child: Slider(
                  value: _position,
                  min: 0.0,
                  max: _duration,
                  onChanged: (double value) async{
                    await audioPlayer.seekToPlayer(value.toInt());
                  },
                )),
                IconButton(
                  icon: Icon(Icons.replay),
                  tooltip: 'Replay',
                  onPressed: () => replay(),
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(this._timeText, style: TextStyle(color: Theme.of(context).primaryColor)),
                Text(this._durationText.toString(), style: TextStyle(color: Theme.of(context).primaryColor))
              ],
              )
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
                            builder: (context) => RecordScreen(story: widget.story)),
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
