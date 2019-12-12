import 'package:bloc/bloc.dart';
import 'package:showmovie/business_logic/bloc/now_playing_event.dart';
import 'package:showmovie/business_logic/bloc/now_playing_state.dart';
import 'package:showmovie/business_logic/model/now_playing_movielist.dart';
import 'package:showmovie/business_logic/repositories/movie_repository.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final MovieRepository movieRepository;
  NowPlayingBloc({this.movieRepository});

  @override
  NowPlayingState get initialState => NowPlayingInitState();

  @override
  Stream<NowPlayingState> mapEventToState(NowPlayingEvent event) async* {
    if (event is FetchAllList) {
      yield NowPlayingLoadingState();
      {
        final Future<NowPlayingMovie> playing =
            movieRepository.fetchAllNowPlayingMovies();
      }

      try {
        Future<NowPlayingMovie> playinglist =
            movieRepository.fetchAllNowPlayingMovies();
        yield NowPlayingLoadedState(nowplayingmovie: playinglist);
      } catch (e) {
        yield NowPlayingErrorState(message: e.toString());
      }
    }
  }
}
