import 'package:flutter/material.dart';
import 'package:showmovie/business_logic/repositories/movie_repository.dart';
import 'package:showmovie/presentation/pages/movie_homepage.dart';

void main() {
  MovieRepository _repository = MovieRepository();
  runApp(MyApp(movieRepository: _repository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;
  MyApp({this.movieRepository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: MovieHomePage(movieRepository: movieRepository));
  }
}
