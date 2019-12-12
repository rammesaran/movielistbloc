import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showmovie/business_logic/bloc/now_playing_bloc.dart';
import 'package:showmovie/business_logic/repositories/movie_repository.dart';
import 'package:showmovie/presentation/pages/movie_tabone_details.dart';

class MovieHomePage extends StatefulWidget {
  final MovieRepository movieRepository;
  MovieHomePage({this.movieRepository});

  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  NowPlayingBloc _nowPlayingBloc;

  @override
  void initState() {
    super.initState();
    _nowPlayingBloc = NowPlayingBloc(movieRepository: widget.movieRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios),
            title: Text(
              'Movies',
              style: TextStyle(fontSize: 16.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text('Tab 1'),
                      ),
                      Tab(
                        child: Text('Investment'),
                      ),
                      Tab(
                        child: Text('Your Earning'),
                      ),
                      Tab(
                        child: Text('Current Balance'),
                      ),
                      Tab(
                        child: Text('Tab 5'),
                      ),
                      Tab(
                        child: Text('Tab 6'),
                      )
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.search),
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              NowPlayingMoviesList(),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 4'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 5'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 6'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
