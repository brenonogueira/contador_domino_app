import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class FourPlayers extends StatefulWidget {
  const FourPlayers({Key? key}) : super(key: key);

  @override
  State<FourPlayers> createState() => _FourPlayersState();
}

class _FourPlayersState extends State<FourPlayers> {
  int _placar1 = 0;
  int _placar2 = 0;

  bool displayText = false;

  final player = AudioCache();

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
    // print(myInterceptor);
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Dupla 1 x Dupla 2'),
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
                          Text('Essa ação irá zerar o marcador'),
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
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('SIM'),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
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
                                onPressed: () {
                                  _incrementPlacar1(50);
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
                                  _incrementPlacar1(-50);
                                },
                                child: Text('-50',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
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
                                padding: const EdgeInsets.all(4.0),
                                child: Text("Dupla 1",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "${_placar1}",
                                  style: TextStyle(fontSize: 50),
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
                              child: Text("Dupla 2",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "${_placar2}",
                                style: TextStyle(fontSize: 50),
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
                                            color: Colors.black, fontSize: 20)),
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
                                            color: Colors.black, fontSize: 20)),
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
                                            color: Colors.black, fontSize: 20)),
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: Colors.blue),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacar2(50);
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
                                  padding: const EdgeInsets.all(4),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _incrementPlacar2(-50);
                                    },
                                    child: Text('-50',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
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
          )),
    );
  }
}
