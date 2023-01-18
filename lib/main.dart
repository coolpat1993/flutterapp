import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/getRequest.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  String currentText = 'SQ App';
  String currentQuestion = 'What is the Capital of France?';
  String selectedKey = '';

  void launchWebView(letter) {
    setState(() {
      selectedKey = letter;
    });
    print('$currentText');
  }

  @override
  Widget build(BuildContext context) {
    final List<String> letters = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'R',
      'S',
      'T',
      'U',
      'Q V',
      'W',
      'Y',
      'X Z'
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              title: Text(currentText)),
          body: Container(
            color: Colors.black,
            child: Column(
              children: [
                FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data!.question!);
                      return Text(
                        snapshot.data!.question!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                Expanded(
                    child: Container(
                  color: Colors.black,
                  width: 380,
                  height: 380,
                  child: GridView.count(
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount: 4,
                    children: letters.map((letter) {
                      return TextButton(
                        style: ButtonStyle(
                            backgroundColor: letter != selectedKey
                                ? MaterialStateProperty.all(
                                    const Color(0xFF00cfff))
                                : MaterialStateProperty.all(
                                    const Color.fromARGB(255, 255, 255, 255)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        onPressed: () {
                          launchWebView(letter);
                        },
                        child: Text(
                          letter,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 30),
                        ),
                      );
                    }).toList(),
                  ),
                )),
                Text(
                  'picked answer: $selectedKey',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}
