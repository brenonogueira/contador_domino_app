import 'package:domino_app/screens/four_players.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
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


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
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
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: OutlinedButton.icon(
                    //     onPressed: () {
                    //       // Respond to button press
                    //     },
                    //     icon: Icon(Icons.add, size: 18),
                    //     label: Text("3", style: TextStyle(fontSize: 20)),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Respond to button press
                          // Navigator.pushNamed(context, '/fourplayers');

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FourPlayers()));
                        },
                        icon: Icon(Icons.person, size: 18),
                        label: Text("4 (dupla)", style: TextStyle(fontSize: 20)),
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
             child: ElevatedButton(onPressed:  _launchUrl, child: Text('Developed by: @brenongr')),
          ),
        ),
      ),
    );
  }
}
