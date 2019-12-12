import 'package:showmovie/business_logic/model/now_playing_movielist.dart';

abstract class NowPlayingEvent {}

class FetchAllList extends NowPlayingEvent {
  final NowPlayingMovie nowPlayingMovie;

  FetchAllList({this.nowPlayingMovie}) : assert(nowPlayingMovie != null);
}
