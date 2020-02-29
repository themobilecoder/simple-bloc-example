part of 'music_player_bloc.dart';

@immutable
abstract class MusicPlayerState {
  const MusicPlayerState();
}

class MusicPlayerIdle extends MusicPlayerState {}

class MusicPlayerPlaying extends MusicPlayerState {
  final String musicTitle;
  const MusicPlayerPlaying({@required this.musicTitle})
      : assert(musicTitle != null);
}

class MusicPlayerPaused extends MusicPlayerState {}
