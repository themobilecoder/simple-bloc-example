part of 'music_player_bloc.dart';

@immutable
abstract class MusicPlayerEvent {}

class PlayEvent extends MusicPlayerEvent {}

class PauseEvent extends MusicPlayerEvent {}

class StopEvent extends MusicPlayerEvent {}
