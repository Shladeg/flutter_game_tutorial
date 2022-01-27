import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_game_tutorial/game_core/main_loop.dart';
import 'package:flutter_game_tutorial/utils/global_var.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  ReceivePort? _receivePort;
  Isolate? _isolateLoop;

  void _startIsolateLopp() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort?.sendPort);

    _receivePort?.listen((message) {
      GlobalVars.currentScene.update();
      setState(() {});
    });
  }

  @override
  void initState() {
    _startIsolateLopp();
    super.initState();
  }

  @override
  void dispose() {
    _receivePort?.close();
    _isolateLoop?.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalVars.currentScene.buildScene();
  }
}
