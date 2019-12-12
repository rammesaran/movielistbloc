import 'package:showmovie/business_logic/model/now_playing_movielist.dart';

abstract class NowPlayingState {}

class NowPlayingInitState extends NowPlayingState {}

class NowPlayingLoadingState extends NowPlayingState {}

class NowPlayingLoadedState extends NowPlayingState {
  final Future<NowPlayingMovie> nowplayingmovie;
  NowPlayingLoadedState({this.nowplayingmovie});
}

class NowPlayingErrorState extends NowPlayingState {
  final String message;
  NowPlayingErrorState({this.message});
}
