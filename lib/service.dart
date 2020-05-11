import 'dart:convert';
import 'package:http/http.dart' as http;
import 'album_model.dart';

class Api {
  final String albumUrl = "https://jsonplaceholder.typicode.com/albums";

  Future<Album> fetchAlbum() async {
    http.Response response = await http.get(albumUrl + "/1");

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Album');
    }
  }

  Future<Album> createAlbum(String title) async {
    final http.Response response = await http.post(
      albumUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
