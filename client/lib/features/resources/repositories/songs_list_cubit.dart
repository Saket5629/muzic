// songs_list_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muzic/features/resources/repositories/song_list_info.dart';
import 'package:muzic/features/resources/repositories/songs_list_repo.dart';

part 'songs_list_state.dart';

class SongsListCubit extends Cubit<SongsListState> {
  SongsListCubit({required this.repository})
      : super(const SongsListState());

  final SongsListRepository repository;

  Future<void> fetchLibrary() async {
    // Emit loading so UI shows a spinner
    emit(state.copyWith(songsListStatus: SongsListStatus.loading));

    try {
      final info = await repository.fetchLibrary();
      emit(state.copyWith(
        songsListStatus: SongsListStatus.success,
        songsListInfo: info,
      ));
    } catch (e) {
      emit(state.copyWith(
        songsListStatus: SongsListStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}