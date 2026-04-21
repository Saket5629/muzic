import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muzic/features/resources/repositories/album_info.dart';
import 'package:muzic/features/resources/repositories/player_cubit.dart';

class SongCard extends StatelessWidget {
  const SongCard({super.key, required this.song});

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PlayerCubit>().playSong(song);
      },
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(song.coverUrl, height: 120, width: 120, fit: BoxFit.cover),
            ),

            const SizedBox(height: 8),

            // Song Name
            Text(song.songName, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
