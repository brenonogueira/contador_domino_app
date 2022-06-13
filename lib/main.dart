import 'package:domino_app/screens/four_players.dart';
import 'package:domino_app/screens/three_players.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:link_text/link_text.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      title: 'Marcador de Dominó',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: "Marcador",
      ),
      // routes: {
      //   '/fourplayers': (context) => FourPlayers(),
      //   // '/': (context) => MyHomePage(title: 'Contador de Dominó'),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final Uri _url = Uri.parse('https://www.instagram.com/brenongr/');

  //dupla 1
  var dupla1Nome1Controller = TextEditingController();
  var dupla1Nome2Controller = TextEditingController();
  //dupla 2
  var dupla2Nome1Controller = TextEditingController();
  var dupla2Nome2Controller = TextEditingController();

  // 3 jogadores
  var jogador1Controller = TextEditingController();
  var jogador2Controller = TextEditingController();
  var jogador3Controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  void initState() {
    super.initState();
    dupla1Nome1Controller = TextEditingController(text: '');
    dupla1Nome2Controller = TextEditingController(text: '');
    dupla2Nome1Controller = TextEditingController(text: '');
    dupla2Nome2Controller = TextEditingController(text: '');
    // print();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Escolha a quantidade de jogadores:',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton.icon(
                        icon: Icon(Icons.person, size: 18),
                        label: Text("3", style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 680,
                                  color: Color.fromARGB(255, 122, 130, 133),
                                  child: Column(
                                    // mainAxisAlignment:MainAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Jogadores",
                                              style: TextStyle(fontSize: 20))),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: jogador1Controller,
                                          decoration: InputDecoration(
                                            labelText: 'Jogador 1',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: jogador2Controller,
                                          decoration: InputDecoration(
                                            labelText: 'Jogador 2',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: jogador3Controller,
                                          decoration: InputDecoration(
                                            labelText: 'Jogador 3',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        child: const Text('INICIAR'),
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ThreePlayers(
                                                      null,
                                                      jogador1Controller,
                                                      jogador2Controller,
                                                      jogador3Controller,
                                                    ))),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 680,
                                  color: Color.fromARGB(255, 122, 130, 133),
                                  child: Column(
                                    // mainAxisAlignment:MainAxisAlignment.center,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Dupla 1 - Jogadores:",
                                              style: TextStyle(fontSize: 20))),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: dupla1Nome1Controller,
                                          decoration: InputDecoration(
                                            labelText: 'Nome',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: dupla1Nome2Controller,
                                          decoration: InputDecoration(
                                            labelText: 'Nome',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Dupla 2 - Jogadores:",
                                              style: TextStyle(fontSize: 20))),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: dupla2Nome1Controller,
                                          decoration: InputDecoration(
                                            labelText: 'Nome',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: dupla2Nome2Controller,
                                          decoration: InputDecoration(
                                            labelText: 'Nome',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        child: const Text('INICIAR'),
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FourPlayers(
                                                        null,
                                                        dupla1Nome1Controller,
                                                        dupla1Nome2Controller,
                                                        dupla2Nome1Controller,
                                                        dupla2Nome2Controller))),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.person, size: 18),
                        label:
                            Text("4 (dupla)", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 50,
          child: Center(
            child: OutlinedButton(
                onPressed: _launchUrl,
                child: Text('Developed by: @brenongr | 2022')),
          ),
        ),
      ),
    );
  }
}
