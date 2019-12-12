import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showmovie/business_logic/bloc/now_playing_state.dart';

class NowPlayingMoviesList extends StatefulWidget {
  @override
  _NowPlayingMoviesListState createState() => _NowPlayingMoviesListState();
}

class _NowPlayingMoviesListState extends State<NowPlayingMoviesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of(context),
        builder: (context, state) {
          if (state is NowPlayingInitState) {
            return Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            final stateAsFetched = state as NowPlayingLoadedState;
            final nowplayingmovies = stateAsFetched.nowplayingmovie;
          }
        });
  }
}

Future<Widget> buildList(nowplayingmovies) async => GridView.builder(
    itemCount: nowplayingmovies.data.results.length,
    gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return GridTile(
        child: InkResponse(
            enableFeedback: true,
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${nowplayingmovies.data.results[index].posterPath}',
              fit: BoxFit.cover,
            ),
            onTap: () => {}),
      );
    });
