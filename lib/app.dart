import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_example/music_player/music_player.dart';
import 'package:simple_bloc_example/music_player_bloc/music_player_bloc.dart';

class App extends StatelessWidget {
  final MusicPlayer musicPlayer = DummyMusicPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple Bloc Pattern',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (BuildContext context) => MusicPlayerBloc(DummyMusicPlayer()),
          child: MainScreen(),
        ));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MusicPlayerBloc, MusicPlayerState>(builder: (_, state) {
          if (state is MusicPlayerPlaying) {
            return Text('Playing: ${state.musicTitle}');
          } else if (state is MusicPlayerPaused) {
            return Text('Paused');
          } else {
            return Text('Music Player');
          }
        }),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<MusicPlayerBloc, MusicPlayerState>(builder: (context, state) {
              if (state is MusicPlayerIdle || state is MusicPlayerPaused) {
                return SimpleButton(
                    icon: Icons.play_arrow,
                    onPressed: () {
                      BlocProvider.of<MusicPlayerBloc>(context).add(PlayEvent());
                    });
              } else {
                return SimpleButton(
                    icon: Icons.pause,
                    onPressed: () {
                      BlocProvider.of<MusicPlayerBloc>(context).add(PauseEvent());
                    });
              }
            }),
            BlocBuilder<MusicPlayerBloc, MusicPlayerState>(builder: (_, state) {
              if (state is MusicPlayerPlaying || state is MusicPlayerPaused) {
                return SimpleButton(
                    icon: Icons.stop,
                    onPressed: () {
                      BlocProvider.of<MusicPlayerBloc>(context).add(StopEvent());
                    });
              } else {
                return Container(
                  width: 0,
                );
              }
            })
          ],
        ),
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  SimpleButton({@required this.onPressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: 46,
    );
  }
}
