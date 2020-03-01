part of 'music_player_bloc.dart';

@immutable
abstract class MusicPlayerEvent {
  const MusicPlayerEvent();
}

class PlayEvent extends MusicPlayerEvent {
  final String musicTitle;
  const PlayEvent({@required this.musicTitle}) : assert(musicTitle != null);
}

class PauseEvent extends MusicPlayerEvent {}

class StopEvent extends MusicPlayerEvent {}
