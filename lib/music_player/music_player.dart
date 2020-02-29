abstract class MusicPlayer {
  Future<bool> play();
  Future<bool> pause();
  Future<bool> stop();
}

class DummyMusicPlayer extends MusicPlayer {
  @override
  Future<bool> pause() {
    return Future.value(true);
  }

  @override
  Future<bool> play() {
    return Future.value(true);
  }

  @override
  Future<bool> stop() {
    return Future.value(true);
  }
}
