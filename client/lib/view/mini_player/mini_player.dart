import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muzic/features/resources/repositories/album_info.dart';
import 'package:muzic/features/resources/repositories/player_cubit.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key, required this.song, required this.isPlaying, required this.onTogglePlay});

  final SongModel song;
  final bool isPlaying;
  final VoidCallback onTogglePlay;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlayerCubit>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(song.coverUrl, height: 50, width: 50, fit: BoxFit.cover),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(song.songName, style: const TextStyle(color: Colors.white)),
                    const Text("Arijit Singh", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              IconButton(
                onPressed: onTogglePlay,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
              ),
            ],
          ),

          StreamBuilder<PositionData>(
            stream: cubit.positionDataStream(),
            builder: (context, snapshot) {
              final data = snapshot.data;

              final position = data?.position ?? Duration.zero;
              final duration = data?.duration ?? Duration.zero;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                    child: SliderTheme(
                      data: SliderTheme.of(
                        context,
                      ).copyWith(trackHeight: 2, thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6), overlayShape: const RoundSliderOverlayShape(overlayRadius: 10)),
                      child: Slider(
                        value: position.inSeconds.toDouble(),
                        max: duration.inSeconds.toDouble() > 0 ? duration.inSeconds.toDouble() : 1,
                        onChanged: (value) {
                          cubit.seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_format(position), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                      Text(_format(duration), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  String _format(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }
}
