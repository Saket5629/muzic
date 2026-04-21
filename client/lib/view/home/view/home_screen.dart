import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muzic/view/home/view/song_card.dart';
import 'package:muzic/features/resources/repositories/songs_list_cubit.dart';
import 'package:muzic/features/resources/repositories/songs_list_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongsListCubit(repository: SongsListRepository()),
      child: const HomeScreenView(),
    );
  }
}
class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late final ScrollController _innerScrollCtrl;

  @override
  void initState() {
    super.initState();
    _innerScrollCtrl = ScrollController();
    context.read<SongsListCubit>().fetchLibrary();
  }

  @override
  void dispose() {
    _innerScrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _innerScrollCtrl,
      slivers: [
        BlocBuilder<SongsListCubit, SongsListState>(
          builder: (context, state) {
            if (state.songsListStatus == SongsListStatus.loading) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state.songsListStatus == SongsListStatus.failure) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(state.errorMessage ?? "Something went wrong"),
                ),
              );
            } else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final album = state.songsListInfo.albums[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            album.albumName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: album.songs.length,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            itemBuilder: (context, songIndex) {
                              return SongCard(
                                song: album.songs[songIndex],
                              );
                            },
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: state.songsListInfo.albums.length,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}