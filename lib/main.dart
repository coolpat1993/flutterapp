import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              title: const Text('This is is my new App!')),
          body: Container(
            color: Colors.black,
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                Text(
                  'What is the capital of France?',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                    child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: double.infinity,
                  child: GridView.count(
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    crossAxisCount: 4,
                    children: letters.map((letter) {
                      return TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF00cfff)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                        onPressed: () {},
                        child: Text(
                          letter,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 30),
                        ),
                      );
                    }).toList(),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
