// song_model.dart
class SongModel {
  const SongModel({
    required this.songName,
    required this.duration,
    required this.audioPublicId,
    required this.coverUrl,
  });

  final String songName;
  final double? duration;      // nullable — Cloudinary may not have it
  final String audioPublicId;  // sent to /stream API when user taps
  final String coverUrl;

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      songName: json['song_name'] as String,
      duration: (json['duration'] as num?)?.toDouble(),
      audioPublicId: json['audio_public_id'] as String,
      coverUrl: json['cover_url'] as String,
    );
  }
}

// album_model.dart
class AlbumModel {
  const AlbumModel({
    required this.albumName,
    required this.songs,
  });

  final String albumName;
  final List<SongModel> songs;

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      albumName: json['album_name'] as String,
      songs: (json['songs'] as List)
          .map((s) => SongModel.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }
}