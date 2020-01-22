import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:typed_data' show Uint8List;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

enum MEDIA_TYPE {
  FILE,
  BUFFER,
  ASSET,
  STREAM
}

class SoundUtils {

  static Future<String> startPlayer(FlutterSound player, MEDIA_TYPE type, String path) async {
    String resultPath;
    try {

      if (type == MEDIA_TYPE.ASSET) {
        Uint8List buffer = (await rootBundle.load(path)).buffer.asUint8List();
        resultPath = await player.startPlayerFromBuffer(buffer);
      }
      else if (type == MEDIA_TYPE.FILE) { // Do we want to play from buffer or from file ?
        if (await File(path).exists())
          resultPath = await player.startPlayer(path); // From file
      }
      else if (type == MEDIA_TYPE.BUFFER) { // Do we want to play from buffer or from file ?
        if (await File(path).exists()) {
          Uint8List buffer = await _makeBuffer(path);
          if (buffer != null)
            resultPath = await player.startPlayerFromBuffer(buffer); // From buffer
        }
      }
    }
    catch (e) {
      print("Error starting player: "+e.toString());
    }

    print("playing $resultPath");
    return resultPath;
  }


  static Future <Uint8List> _makeBuffer(String path) async {
    try {
      if (!await File(path).exists())
        return null;
      File file = File(path);
      file.openRead();
      var contents = await file.readAsBytes ();
      print ('The file is ${contents.length} bytes long.');
      return contents;
    } catch (e) {
      print(e);
      return null;
    }
  }
  
}