import 'package:muzic/features/resources/repositories/album_info.dart';
class PlayerState {
  final SongModel? currentSong;
  final bool isPlaying;
  final String? streamUrl;

  PlayerState({this.currentSong, this.isPlaying = false, this.streamUrl});

  PlayerState copyWith({
    SongModel? currentSong,
    bool? isPlaying,
    String? streamUrl,
  }) {
    return PlayerState(
      currentSong: currentSong ?? this.currentSong,
      isPlaying: isPlaying ?? this.isPlaying,
      streamUrl: streamUrl ?? this.streamUrl,
    );
  }
}