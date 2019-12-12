import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:showmovie/business_logic/model/now_playing_movielist.dart';

class MovieService {
  final _apitoken = '5af9688122130d2f783da63d634c0641';
  final _baseurl = "https://api.themoviedb.org/3/movie";

  Future<NowPlayingMovie> getcurrentplaymovie() async {
    final response = await http.get("$_baseurl/now_playing?api_key=$_apitoken");

    if (response.statusCode <= 200 || response.statusCode >= 400) {
      var result = NowPlayingMovie.fromJson(json.decode(response.body));
      return (result);
    } else {
      return throw Exception('Something went wrong.');
    }
  }
}
