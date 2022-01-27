import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_game_tutorial/entities/player.dart';
import 'package:flutter_game_tutorial/game_core/main_loop.dart';
import 'package:flutter_game_tutorial/utils/common_var.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  ReceivePort? _receivePort;
  Isolate? _isolateLoop;

  late Player player;

  void startIsolateLopp() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort?.sendPort);

    _receivePort?.listen((message) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLopp();
      isFirstStartGame = false;

      player = Player();
    }

    player.update();

    return Stack(
      children: [player.build()],
    );
  }
}
