

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'album_model.dart';

class Api {

  final String albumUrl = "https://jsonplaceholder.typicode.com/albums/1";

  Future<Album> fetchAlbum() async{
    http.Response response = await http.get(albumUrl);

    if(response.statusCode == 200){
      return Album.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load Album');
    }

  }
}