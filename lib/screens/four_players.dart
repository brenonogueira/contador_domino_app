import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wakelock/wakelock.dart';

class FourPlayers extends StatefulWidget {
  const FourPlayers(Key? key, this.dupla1Nome1, this.dupla1Nome2,
      this.dupla2Nome1, this.dupla2Nome2)
      : super(key: key);
  final dupla1Nome1;
  final dupla1Nome2;
  final dupla2Nome1;
  final dupla2Nome2;

  @override
  State<FourPlayers> createState() => _FourPlayersState();
}

class _FourPlayersState extends State<FourPlayers> {
  int _placar1 = 0;
  int _placar2 = 0;

  bool displayText = false;

  final player = AudioCache();

  Object? get dupla1Nome1 => null;

  void _incrementPlacar1(int value) {
    setState(() {
      _placar1 += value;
    });
  }

  void _incrementPlacar2(int value) {
    setState(() {
      _placar2 += value;
    });
  }

  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    // print();
  }

  String backgroundImage = 'assets/images/domino.png';

  Future<void> mudaFundo() async {
    Timer(Duration(milliseconds: 1), () {
      setState(() {
        backgroundImage = 'assets/images/cock.png';
      });
    });
  }

  Future<void> mudaFundo2() async {
    setState(() {
      backgroundImage = 'assets/images/domino.png';
    });
  }

  @override
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    displayText = true;
    // print("BACK BUTTON!"); // Do some stuff.
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
                "${widget.dupla1Nome1.text} e ${widget.dupla1Nome2.text} vs ${widget.dupla2Nome1.text} e ${widget.dupla2Nome2.text}",
                style: TextStyle(fontSize: 12)),
          ),
          body: WillPopScope(
            onWillPop: () async {
              bool willLeave = false;
              return willLeave;
            },
            child: displayText
                ? AlertDialog(
                    title: const Text('TEM CERTEZA?'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('Você realmente deseja fazer isso?'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => {displayText = false, setState(() {})},
                        child: const Text('NÃO'),
                      ),
                      TextButton(
                        onPressed: () => {
                          Navigator.pop(context, 'OK'),
                          widget.dupla1Nome1.clear(),
                          widget.dupla1Nome2.clear(),
                          widget.dupla2Nome1.clear(),
                          widget.dupla2Nome2.clear()
                        },
                        child: const Text('SIM'),
                      ),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        opacity: 0.10,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    _incrementPlacar1(-10);
                                  },
                                  child: Text('-10',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    _incrementPlacar1(5);
                                  },
                                  child: Text('5',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    _incrementPlacar1(10);
                                  },
                                  child: Text('10',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: OutlinedButton(
                                  onPressed: () async {
                                    _incrementPlacar1(50);
                                    player.play('galowav.wav', isNotification: true);
                                    await mudaFundo();
                                    await Future.delayed(Duration(seconds: 2),
                                        () {
                                      mudaFundo2();
                                    });
                                  },
                                  child: Container(
                                    width: 38,
                                    height: 38,
                                    child: Image.asset(
                                      'assets/images/cock.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    _incrementPlacar1(-50);
                                      player.play('galo_menos_cinquenta.mp3', isNotification: true);
                                  },
                                  child: Container(
                                    width: 38,
                                    height: 38,
                                    child:  RotatedBox(
                                       quarterTurns: 2,
                                      child: Image.asset(
                                        'assets/images/cock.png',
                                        height: 60,
                                        width: 60,
                                        
                                      ),
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                      "${widget.dupla1Nome1.text.toString().toUpperCase()} e ${widget.dupla1Nome2.text.toString().toUpperCase()}",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.blue)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${_placar1}",
                                    style: TextStyle(
                                      fontSize: 70,
                                      color:
                                          _placar1 >= 200 && _placar1 > _placar2
                                              ? Colors.green
                                              : _placar1 < 0
                                                  ? Colors.red
                                                  : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 50,
                                          color: Colors.black,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Divider(
                                color: Colors.black,
                              ),
                            ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                    "${widget.dupla2Nome1.text.toString().toUpperCase()} e ${widget.dupla2Nome2.text.toString().toUpperCase()}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.redAccent)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "${_placar2}",
                                  style: TextStyle(
                                    fontSize: 70,
                                    color:
                                        _placar2 >= 200 && _placar2 > _placar1
                                            ? Colors.green
                                            : _placar2 < 0
                                                ? Colors.red
                                                : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 50,
                                        color: Colors.black,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.s,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        _incrementPlacar2(-10);
                                      },
                                      child: Text('-10',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        _incrementPlacar2(5);
                                      },
                                      child: Text('5',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        _incrementPlacar2(10);
                                      },
                                      child: Text('10',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)),
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: OutlinedButton(
                                      onPressed: () async {
                                        _incrementPlacar2(50);
                                        player.play('galowav.wav', isNotification: true);
                                        await mudaFundo();
                                        await Future.delayed(
                                            Duration(seconds: 2), () {
                                          mudaFundo2();
                                        });
                                      },
                                      child: Container(
                                        width: 38,
                                        height: 38,
                                        child: Image.asset(
                                          'assets/images/cock.png',
                                          height: 60,
                                          width: 60,
                                        ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.green),
                                    ),
                                  ),
                                 Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: OutlinedButton(
                                  onPressed: () {
                                    _incrementPlacar2(-50);
                                    player.play('galo_menos_cinquenta.mp3', isNotification: true);
                                  },
                                  child: Container(
                                    width: 38,
                                    height: 38,
                                    child:  RotatedBox(
                                       quarterTurns: 2,
                                      child: Image.asset(
                                        'assets/images/cock.png',
                                        height: 60,
                                        width: 60,
                                        
                                      ),
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                ),
                              ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          )),
    );
  }
}
