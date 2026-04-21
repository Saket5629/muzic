// songs_list_state.dart
part of 'songs_list_cubit.dart';

enum SongsListStatus { loading, success, failure }

class SongsListState {
  const SongsListState({
    this.songsListStatus = SongsListStatus.loading,
    this.songsListInfo = const SongsListInfo.empty(),
    this.errorMessage,
  });

  final SongsListStatus songsListStatus;
  final SongsListInfo songsListInfo;
  final String? errorMessage;   // holds error text on failure

  SongsListState copyWith({
    SongsListStatus? songsListStatus,
    SongsListInfo? songsListInfo,
    String? errorMessage,
  }) {
    return SongsListState(
      songsListStatus: songsListStatus ?? this.songsListStatus,
      songsListInfo: songsListInfo ?? this.songsListInfo,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}