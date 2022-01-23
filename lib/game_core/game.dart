import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_game_tutorial/game_core/main_loop.dart';
import 'package:flutter_game_tutorial/utils/common_var.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  double x = 100;
  double y = 200;

  ReceivePort? _receivePort;
  Isolate? _isolateLoop;

  void startIsolateLopp() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort?.sendPort);

    _receivePort?.listen((message) {
      setState(() {});

      x++;

      if (x == 500) {
        x = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLopp();
      isFirstStartGame = false;
    }

    return Stack(
      children: [
        Positioned(
          child: Text("qweqwe"),
          top: y,
          left: x,
        )
      ],
    );
  }
}
