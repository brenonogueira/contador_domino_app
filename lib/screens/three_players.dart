import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:wakelock/wakelock.dart';

class ThreePlayers extends StatefulWidget {
  const ThreePlayers(Key? key, this.jogador1, this.jogador2, this.jogador3)
      : super(key: key);

  final jogador1;
  final jogador2;
  final jogador3;

  @override
  State<ThreePlayers> createState() => _ThreePlayersState();
}

class _ThreePlayersState extends State<ThreePlayers> {
  int _placarJogador1 = 0;
  int _placarJogador2 = 0;
  int _placarJogador3 = 0;
  bool displayText = false;
  final player = AudioCache();

  void _incrementPlacarJogador1(int value) {
    setState(() {
      _placarJogador1 += value;
    });
  }

  void _incrementPlacarJogador2(int value) {
    setState(() {
      _placarJogador2 += value;
    });
  }

  void _incrementPlacarJogador3(int value) {
    setState(() {
      _placarJogador3 += value;
    });
  }

  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
    // print();
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
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
           resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
                " ${widget.jogador1.text}, ${widget.jogador2.text}, ${widget.jogador3.text}",
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
                          onPressed: () =>
                              {displayText = false, setState(() {})},
                          child: const Text('NÃO'),
                        ),
                        TextButton(
                          onPressed: () => {
                            Navigator.pop(context, 'OK'),
                            widget.jogador1.clear(),
                            widget.jogador2.clear(),
                            widget.jogador3.clear(),
                          },
                          child: const Text('SIM'),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                    child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacarJogador1(-10);
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
                                      _incrementPlacarJogador1(5);
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
                                      _incrementPlacarJogador1(10);
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
                                    onPressed: () {
                                      _incrementPlacarJogador1(50);
                                      player.play('galowav.wav');
                                    },
                                    child: Text(
                                      '50',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacarJogador1(-50);
                                    },
                                    child: Text('-50',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                  ),
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('${widget.jogador1.text}', style: TextStyle(fontSize: 20))],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('${_placarJogador1}', style: TextStyle(fontSize: 30))],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacarJogador2(-10);
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
                                      _incrementPlacarJogador2(5);
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
                                      _incrementPlacarJogador2(10);
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
                                    onPressed: () {
                                      _incrementPlacarJogador2(50);
                                      player.play('galowav.wav');
                                    },
                                    child: Text(
                                      '50',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacarJogador2(-50);
                                    },
                                    child: Text('-50',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                  ),
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('${widget.jogador2.text}', style: TextStyle(fontSize: 20))],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('${_placarJogador2}', style: TextStyle(fontSize: 30))],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
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
                        ),
                         Padding(
                            padding: const EdgeInsets.only(bottom: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacarJogador3(-10);
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
                                      _incrementPlacarJogador3(5);
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
                                      _incrementPlacarJogador3(10);
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
                                    onPressed: () {
                                      _incrementPlacarJogador3(50);
                                      player.play('galowav.wav');
                                    },
                                    child: Text(
                                      '50',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacarJogador3(-50);
                                    },
                                    child: Text('-50',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                  ),
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('${widget.jogador3.text}', style: TextStyle(fontSize: 20))],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('${_placarJogador3}', style: TextStyle(fontSize: 30))],
                        ),
                      ]),
                  )),
        ));
  }
}
