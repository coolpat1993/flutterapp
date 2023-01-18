import 'package:http/http.dart' as http;
import 'dart:convert';

class Album {
  final String type;
  final String? question;
  final String? answer;

  const Album({
    required this.type,
    this.question,
    this.answer,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      type: json['type'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://coolpat1993.github.io/Data/questions.json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> list = json.decode(response.body)['questions'];
    Album fact = Album.fromJson(list[2]);
    return fact;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
