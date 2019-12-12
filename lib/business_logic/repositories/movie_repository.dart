import 'package:showmovie/business_logic/model/now_playing_movielist.dart';
import 'package:showmovie/data/services/movie_services.dart';

class MovieRepository {
  final movieApi = MovieService();

  Future<NowPlayingMovie> fetchAllNowPlayingMovies() =>
      movieApi.getcurrentplaymovie();
}
