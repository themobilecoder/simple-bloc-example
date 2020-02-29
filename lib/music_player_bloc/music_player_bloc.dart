import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_bloc_example/music_player/music_player.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  final MusicPlayer _musicPlayer;

  MusicPlayerBloc(this._musicPlayer) : assert(_musicPlayer != null);

  @override
  MusicPlayerState get initialState => MusicPlayerIdle();

  @override
  Stream<MusicPlayerState> mapEventToState(
    MusicPlayerEvent event,
  ) async* {
    if (event is PlayEvent) {
      _musicPlayer.play();
      yield MusicPlayerPlaying(musicTitle: 'Fix You');
    } else if (event is PauseEvent) {
      _musicPlayer.pause();
      yield MusicPlayerPaused();
    } else if (event is StopEvent) {
      _musicPlayer.stop();
      yield MusicPlayerIdle();
    }
  }
}
